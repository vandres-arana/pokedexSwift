//
//  ListView.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//
//

import Foundation
import UIKit
import PullUpController
import Apollo
import Kingfisher

class ListView: UIViewController {

    // MARK: Properties
    var presenter: ListPresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    var data = [GetAllPokemonsWithLimitQuery.Data.Pokemon]()
    var filtersMenu: FiltersMenuView?
    var fetchMore = false

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.startfetchingPokemonList()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.filtersMenu = FiltersMenuWireFrame.createFiltersMenuModule() as? FiltersMenuView
        self.filtersMenu?.listView = self
    }
    @IBAction func onFilterButtonTapped(_ sender: Any) {
        addPullUpController(self.filtersMenu!, initialStickyPointOffset: CGFloat(1000), animated: true)
    }
}

extension ListView: ListViewProtocol {
    func showPokemonList(list: GetAllPokemonsWithLimitQuery.Data) {
        self.fetchMore = false
        self.data = list.pokemons
        self.tableView.reloadData()
    }
    func showError() {
    }
}

extension ListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellView.cellIdentifier, for: indexPath)
        cell.textLabel?.text = data[indexPath.row].name
        cell.imageView?.kf.setImage(with: self.data[indexPath.row].getImageUrl()) { _ in
            cell.setNeedsLayout()
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
