//
//  AnimesTableViewCell.swift
//  IndividualChallenge
//
//  Created by Narely Lima on 14/10/22.
//

import UIKit

class AnimesTableViewCell: UITableViewCell {
    // identificador da celula reutilizavel
    static let identifier: String = "AnimesTableViewCell"
    var imageAnime: String? {
        didSet {
            Task {
                self.imageViewAnimes.addImageFromURL(urlString: imageAnime!)
            }
        }
    }
    // apresentar o que teremos na nossa celula
    // imagem, canonicaltitle, synopsis, avarege rating
    lazy var imageViewAnimes: UIImageView = {
        let image = UIImageView()
        // dizemos que não é pra aplicar o layout automatico
        // para podermos personalizar
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    lazy var titleViewAnimes: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .black
        text.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return text
    }()
    lazy var synopsisViewAnimes: UILabel = {
        let synopsis = UILabel()
        synopsis.translatesAutoresizingMaskIntoConstraints = false
        synopsis.textColor = .black
        synopsis.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return synopsis
    }()
    lazy var avaregeViewAnimes: UILabel = {
        let avarege = UILabel()
        avarege.translatesAutoresizingMaskIntoConstraints = false
        avarege.textColor = .black
        avarege.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return avarege
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // add title
        // add os componentes
        addSubview(imageViewAnimes)
        addSubview(titleViewAnimes)
        addSubview(avaregeViewAnimes)
        // add as constraints dos componentes
        constraintsImage()
        constraintsTitle()
        constraintsAverage()
    }

    func constraintsImage() {
        imageViewAnimes.layer.cornerRadius = 40
        imageViewAnimes.clipsToBounds = true
        NSLayoutConstraint.activate([
            imageViewAnimes.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageViewAnimes.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            imageViewAnimes.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/4.5),
            imageViewAnimes.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2.5)
        ])
    }
    func constraintsTitle() {
        titleViewAnimes.adjustsFontSizeToFitWidth = true
        titleViewAnimes.numberOfLines = 2
        NSLayoutConstraint.activate([
            titleViewAnimes.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleViewAnimes.leadingAnchor.constraint(equalTo: imageViewAnimes.trailingAnchor, constant: 20),
            titleViewAnimes.topAnchor.constraint(equalTo: avaregeViewAnimes.bottomAnchor),
            titleViewAnimes.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/4.5),
            titleViewAnimes.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2)
        ])
    }
    func constraintsAverage() {
        NSLayoutConstraint.activate([
            avaregeViewAnimes.leadingAnchor.constraint(equalTo: imageViewAnimes.trailingAnchor, constant: 20),
            avaregeViewAnimes.heightAnchor.constraint(equalToConstant: 80),
            avaregeViewAnimes.bottomAnchor.constraint(equalTo: titleViewAnimes.topAnchor,
                                                      constant: UIScreen.main.bounds.height/4)
        ])
    }
    // serve para indicar que o requisito do inicializador se aplica a outras subclasses na cadeia.
    // falar com mateus
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIImageView {

    func addImageFromURL(urlString: String) {
        guard let imageURL: URL = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: imageURL) { (data, _, _) in
            if let imageData = data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: imageData)
                }
            }
        }
        task.resume()
    }
}
