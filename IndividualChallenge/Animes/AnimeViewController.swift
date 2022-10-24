//
//  ViewController.swift
//  IndividualChallenge
//
//  Created by Narely Lima on 11/10/22.
//

import Foundation
import UIKit

class AnimeViewController: UIViewController {

    var animesList: [AnimesModel] = [] {
    // Executa um codigo depois de uma atualizacao 
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    enum AnimesFetcherError: Error {
        case invalidURL
        case missingData
    }
    // CRIAR TABLEVIEW
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = true
        tableView.separatorStyle = .singleLine
        tableView.delegate = self
        tableView.dataSource = self

        // REGISTRO DA CELULA MODELO DA TABLEVIEW
        tableView.register(AnimesTableViewCell.self, forCellReuseIdentifier: AnimesTableViewCell.identifier)

        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(self.tableView)
        title = "Animes"
        configConstraints()
        fetchApi()
    }
    func configConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    func fetchApi() {
        Task {
            do {
                animesList = try await fetchAnimes()
            } catch {
                print(error)
            }
        }
    }
    func fetchAnimes() async throws -> [AnimesModel] {
        // withCheckedThrowingContinuation cria uma tarefa assincrona que executa
        // a funcao fetchAnimesAsync para acionar a solicitacao
        // de rede de forma assincrona
        // validacao da api
        guard let url = URL(string: "https://kitsu.io/api/edge/anime") else {
            throw AnimesFetcherError.invalidURL
        }
        // caso seja verdade executar o que esta dentro do do catch
        // constante que carrega uma solicitacao GET padrao
        // o uso do try indica que um erro pode ser lancado
        // primeiro carregamos um jSON e, em seguida, decodificamos os dados desse JSON de um
        // determinado URL
        let (data, _) = try await URLSession.shared.data(from: url)
        let responsedAnimes = try JSONDecoder().decode(Response.self, from: data)
        return responsedAnimes.data
    }
}
// EXTENSAO DA CLASSE PARA ESPECIFICAR OS DELEGADOS E CONTEUDOS
extension AnimeViewController: UITableViewDelegate, UITableViewDataSource {
    // CONTAR O NUMERO DE SECOES NA TABLEVIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animesList.count
    }
    // CUSTOMIZAR A CELULA A PARTIR DE DADOS CONSUMIDOS
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // analisar se existe celula para reutilizar
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: AnimesTableViewCell.identifier,
            for: indexPath
        ) as? AnimesTableViewCell else { return UITableViewCell() }
        let animes = self.animesList[indexPath.row]
        // atribuindo as variaveis da API
        // as variaveis inseridas na celula de visualizacao
        cell.imageViewAnimes.addImageFromURL(urlString: animes.attributes.posterImage.original)
        cell.titleViewAnimes.text = animes.attributes.canonicalTitle
        cell.synopsisViewAnimes.text = animes.attributes.synopsis
        cell.avaregeViewAnimes.text = animes.attributes.averageRating
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height/4
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewAnime = DetailsAnimes()
        detailViewAnime.animeModel = self.animesList[indexPath.row]
        navigationController?.pushViewController(detailViewAnime, animated: true)
    }

}
