//
//  FiltersMenuPresenter.swift
//  Pokedex
//
//  Created by Victor Arana on 4/29/21.
//  
//

import Foundation

class FiltersMenuPresenter {
    weak var view: FiltersMenuViewProtocol?
    var interactor: FiltersMenuInteractorInputProtocol?
    var wireFrame: FiltersMenuWireFrameProtocol?
}

extension FiltersMenuPresenter: FiltersMenuPresenterProtocol {
    func viewDidLoad() {
    }
    func getPokemonFilterListLength(collectionFilterId: CollectionFilter) -> Int {
        return interactor?.getPokemonFilterListCount(collectionFilterId: collectionFilterId) ?? 0
    }
    func getPokemonFilterByIndex(index: Int, collectionFilterId: CollectionFilter) -> Filter {
        return (interactor?.getPokemonFilterByIndex(index: index, collectionFilterId: collectionFilterId))!
    }
    func markPokemonFilterByIndex(index: Int, collectionFilterId: CollectionFilter) {
        interactor?.markPokemonFilterByIndex(index: index, collectionFilterId: collectionFilterId)
    }
    func resetFilters() {
        interactor?.resetFilters()
    }
}

extension FiltersMenuPresenter: FiltersMenuInteractorOutputProtocol {
}
