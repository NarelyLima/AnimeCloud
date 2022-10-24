//
//  FavoriteController.swift
//  IndividualChallenge
//
//  Created by Narely Lima on 21/10/22.
//

import UIKit

class FavoriteController: UIViewController {

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
    lazy var searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Search any anime or manga..."
        search.searchBar.sizeToFit()
        search.searchBar.searchBarStyle = .prominent
        search.searchBar.scopeButtonTitles = ["All"]
//        search.searchBar.scopeButtonTitles = ["All", "Anime", "Manga"]
        search.searchBar.delegate = self
        return search
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
