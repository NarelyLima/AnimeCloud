//
//  DetailsAnimes.swift
//  IndividualChallenge
//
//  Created by Narely Lima on 18/10/22.
//

import UIKit

class DetailsAnimes: UIViewController {
    let detailsAnimesView = DetailsAnimesView()
    var animeModel: AnimesModel?

    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false

        return scroll
    }()

    override func loadView() {
        view = detailsAnimesView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // repetir para cada celular
        if let animeEscolhido = animeModel {

            self.view.addSubview(scrollView)
            constraintsScroll()
            scrollView.addSubview(detailsAnimesView.stackView)
            // add os componentes da celula
            detailsAnimesView.titleViewDetails.text = animeModel?.attributes.canonicalTitle
            detailsAnimesView.imageViewDetails.addImageFromURL(
                urlString: animeEscolhido.attributes.posterImage.original)
            detailsAnimesView.sypnoViewDetails.text = animeModel?.attributes.synopsis
        }
    }

    // constraints de cada componente
    func constraintsScroll() {
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}
