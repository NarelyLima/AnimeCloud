//
//  DetailsView.swift
//  IndividualChallenge
//
//  Created by Narely Lima on 19/10/22.
//

import UIKit

class DetailsAnimesView: UIView {
    var animeModel: AnimesModel?

    lazy var imageViewDetails: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    lazy var titleViewDetails: UILabel = {
        let desc = UILabel()
        desc.translatesAutoresizingMaskIntoConstraints = false
        desc.textColor = .black
        desc.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        return desc
    }()
    lazy var sypnoViewDetails: UILabel = {
        let desc = UILabel()
        desc.translatesAutoresizingMaskIntoConstraints = false
        desc.textColor = .black
        desc.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return desc
    }()
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addStackView()
    }
    func addStackView() {
        addSubview(stackView)
        stackView.addArrangedSubview(titleViewDetails)
        constraintsTitle()
        stackView.addArrangedSubview(imageViewDetails)
        constraintsImage()
        stackView.addArrangedSubview(sypnoViewDetails)
        constraintsSypno()
    }
    // add constraints aos componentes
    func constraintsTitle() {
        titleViewDetails.numberOfLines = 2
        titleViewDetails.adjustsFontSizeToFitWidth = true
        NSLayoutConstraint.activate([
            titleViewDetails.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            titleViewDetails.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleViewDetails.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/1.5)
        ])
    }
    func constraintsImage() {
        imageViewDetails.layer.cornerRadius = 20
        imageViewDetails.clipsToBounds = true
        NSLayoutConstraint.activate([
            imageViewDetails.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageViewDetails.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/4),
            imageViewDetails.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/1.5),
            imageViewDetails.topAnchor.constraint(equalTo: titleViewDetails.bottomAnchor)
        ])
    }
    func constraintsSypno() {
        sypnoViewDetails.numberOfLines = animeModel?.attributes.synopsis.count ?? 0
        sypnoViewDetails.adjustsFontSizeToFitWidth = true
        NSLayoutConstraint.activate([
            sypnoViewDetails.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            sypnoViewDetails.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                      constant: UIScreen.main.bounds.width/10),
            sypnoViewDetails.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                       constant: -UIScreen.main.bounds.width/10),
            sypnoViewDetails.topAnchor.constraint(equalTo: imageViewDetails.bottomAnchor, constant: 20)
        ])
    }

    required init(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
