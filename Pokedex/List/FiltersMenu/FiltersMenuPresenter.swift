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
    
    func getPokemonFilterListLength(filterId: Int) -> Int {
        return interactor?.getPokemonFilterListCount() ?? 0
    }
    
    func getPokemonFilterByIndex(index: Int, filterId: Int) -> Filter {
        return (interactor?.getPokemonFilterByIndex(index: index, filterId: filterId))!
    }
    
    func markPokemonFilterByIndex(index: Int, filterId: Int) {
        interactor?.markPokemonFilterByIndex(index: index, filterId: filterId)
    }
}

extension FiltersMenuPresenter: FiltersMenuInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
