//
//  ListPresenter.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation
import Apollo

class ListPresenter {
    // MARK: Properties
    weak var view: ListViewProtocol?
    var interactor: ListInteractorInputProtocol?
    var wireFrame: ListWireFrameProtocol?
}

extension ListPresenter: ListPresenterProtocol {
    func startfetchingPokemonList() {
        self.interactor?.fetchPokemonList()
    }
    func fetchMorePokemons() {
        self.interactor?.fetchMorePokemons()
    }
    func viewDidLoad() {
    }
    func showFiltersMenu() {
        wireFrame?.presentFiltersMenu(from: self.view!)
    }
}

extension ListPresenter: ListInteractorOutputProtocol {
    func pokemonFetchSuccess(list: GetAllPokemonsWithLimitQuery.Data) {
        self.view?.showPokemonList(list: list)
    }
    func pokemonFetchFail() {
        self.view?.showError()
    }
}
