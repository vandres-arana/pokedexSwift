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
    @IBOutlet var searchBar: UISearchBar!
    var data = [GetAllPokemonsWithLimitQuery.Data.Pokemon]()
    var filtersMenu: FiltersMenuView?
    var fetchMore = false
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.startfetchingPokemonList()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        setStyleSearchBar()
        self.filtersMenu = FiltersMenuWireFrame.createFiltersMenuModule() as? FiltersMenuView
        self.filtersMenu?.listView = self
        tableView.separatorStyle = .none
        register()
    }
    func register() {
        tableView.register(UINib(nibName: Constants.PokemonCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.PokemonCell.cellIdentifier)
    }
    func setStyleSearchBar() {
        let placeholderColor: UIColor = UIColor.init(named: Constants.SearchbarColors.placeholderColor)!
        let background: UIColor = UIColor.init(named: Constants.SearchbarColors.backgroundColor)!
        let placeholderText: String = "What Pokémon are you looking for?"
        self.searchBar.backgroundColor = background
        self.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor : placeholderColor])
        self.searchBar.setPositionAdjustment(UIOffset(horizontal: 12, vertical: 0), for: .search)
        self.searchBar.searchTextPositionAdjustment = UIOffset(horizontal: 12, vertical: 0)
        self.searchBar.setSearchFieldBackgroundImage(UIImage(), for: .normal)
        self.searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        self.searchBar.layer.cornerRadius = 10
        self.searchBar.clipsToBounds = true
        self.searchBar.searchTextField.leftView?.tintColor = placeholderColor
    }
    @IBAction func sortMenu(_ sender: UIButton) {
        let view = SortMenuWireFrame.createSortMenuModule() as! SortMenuViewController
        view.listView = self
        addPullUpController(view, initialStickyPointOffset: CGFloat(1050), animated: true)
        self.view.backgroundColor = UIColor.gray
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
    func dismissView(sortMenu:SortMethod) {
        self.view.backgroundColor = UIColor.white
    }
    func getCurrentSortMethod() -> SortMethod {
        return .smallestnumberfirst
    }
}
extension ListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.PokemonCell.cellIdentifier, for: indexPath) as! CustomPokemonTableViewCell
        cell.selectionStyle = .none
        var pokeImage: UIImage?
        do {
            pokeImage = try UIImage(withContentsOfUrl: data[indexPath.row].getImageUrl()!)
        } catch {
            pokeImage = UIImage()
        }
        cell.updateContent(pokemonId: String(data[indexPath.row].id), pokemonName: data[indexPath.row].name, types: data[indexPath.row].getTypesList(), pokemonImage: pokeImage! )
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedPath = tableView.indexPathForSelectedRow else { return }
        if segue.destination is DetailView {
            if let safeDetailView = segue.destination as? DetailView {
                presenter?.showDetailView(detailView: safeDetailView, with: self.data[selectedPath.row])
            }
        }
    }
}
