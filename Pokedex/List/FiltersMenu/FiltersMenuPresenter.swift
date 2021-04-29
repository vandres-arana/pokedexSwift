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
    
    func getPokemonTypeListLength() -> Int {
        return interactor?.getPokemonTypeListCount() ?? 0
    }
    
    func getPokemonTypeByIndex(index: Int, collection: Int) -> PokemonType {
        return (interactor?.getPokemonTypeByIndex(index: index, collection: collection))!
    }
    
    func markPokemonTypeByIndex(index: Int, collection: Int) {
        interactor?.markPokemonTypeByIndex(index: index, collection: collection)
    }
}

extension FiltersMenuPresenter: FiltersMenuInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
