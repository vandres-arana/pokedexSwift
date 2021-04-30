//
//  FiltersMenuPresenter.swift
//  Pokedex
//
//  Created by Victor Arana on 4/29/21.
//  
//

import Foundation

class FiltersMenuPresenter  {
    
    // MARK: Properties
    weak var view: FiltersMenuViewProtocol?
    var interactor: FiltersMenuInteractorInputProtocol?
    var wireFrame: FiltersMenuWireFrameProtocol?
    
}

extension FiltersMenuPresenter: FiltersMenuPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
    
    func getPokemonTypeFilterListLength() -> Int {
        return interactor?.getPokemonTypeFilterListCount() ?? 0
    }
    
    func getPokemonTypeFilterByIndex(index: Int, collection: Int) -> Filter {
        return (interactor?.getPokemonTypeFilterByIndex(index: index, collection: collection))!
    }
    
    func markPokemonTypeFilterByIndex(index: Int, collection: Int) {
        interactor?.markPokemonTypeFilterByIndex(index: index, collection: collection)
    }
}

extension FiltersMenuPresenter: FiltersMenuInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
