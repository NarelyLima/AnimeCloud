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
        text.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return text
    }()
    lazy var synopsisViewAnimes: UILabel = {
        let synopsis = UILabel()
        synopsis.translatesAutoresizingMaskIntoConstraints = false
        synopsis.textColor = .lightGray
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
        // add os componentes
        addSubview(imageViewAnimes)
        addSubview(titleViewAnimes)
        addSubview(synopsisViewAnimes)
        addSubview(avaregeViewAnimes)
        // add as constraints dos componentes
        contraintsImage()
    }

    func contraintsImage() {
        imageViewAnimes.layer.cornerRadius = UIScreen.main.bounds.height/10
        imageViewAnimes.clipsToBounds = true
        NSLayoutConstraint.activate([
            imageViewAnimes.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageViewAnimes.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            imageViewAnimes.heightAnchor.constraint(equalToConstant: 80),
            imageViewAnimes.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
//    func contraintsTitle() {
//        titleViewAnimes.layer.cornerRadius = UIScreen.main.bounds.height/10
//        titleViewAnimes.clipsToBounds = true
//        NSLayoutConstraint.activate([
//            titleViewAnimes.centerYAnchor.constraint(equalTo: centerYAnchor),
//            titleViewAnimes.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
//            titleViewAnimes.heightAnchor.constraint(equalToConstant: 80),
//            titleViewAnimes.widthAnchor.constraint(equalToConstant: 80)
//        ])
//    }
    // serve para indicar que o requisito do inicializador se aplica a outras subclasses na cadeia.
    // falar com mateus
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
