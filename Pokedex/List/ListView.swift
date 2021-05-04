//
//  ListView.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation
import UIKit
import Apollo

class ListView: UIViewController {

    // MARK: Properties
    var presenter: ListPresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    var data = [GetAllPokemonsWithLimitQuery.Data.Pokemon]()
    var fetchMore = false

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.startfetchingPokemonList()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension ListView: ListViewProtocol {
    func showPokemonList(list: GetAllPokemonsWithLimitQuery.Data) {
        DispatchQueue.main.async {
            self.fetchMore = false
            self.data.append(contentsOf: list.pokemons)
            self.tableView.reloadData()
        }
    }
    func showError() {
        print("Error")
    }
}

extension ListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if !data.isEmpty {
            cell.textLabel?.text = data[indexPath.row].name
            cell.imageView?.image = data[indexPath.row].getImage()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.height {
            if !fetchMore {
                self.fetchMore = true
                self.presenter?.fetchMorePokemons()
            }
        }
    }
}
