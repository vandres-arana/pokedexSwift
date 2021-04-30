//
//  ListPresenter.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation
import Apollo

class ListPresenter  {
    
    // MARK: Properties
    weak var view: ListViewProtocol?
    var interactor: ListInteractorInputProtocol?
    var wireFrame: ListWireFrameProtocol?
    
}

extension ListPresenter: ListPresenterProtocol {
    
    func startfetchingPokemonList() {
        self.interactor?.fetchPokemonList()
    }
    
    func viewDidLoad() {
    }
}

extension ListPresenter: ListInteractorOutputProtocol {
    
    func PokemonFetchSuccess(result: Result<GraphQLResult<GetAllPokemonsWithLimitQuery.Data>, Error>) {
        self.view?.showPokemonList(result: result)
    }
    
    func PokemonFetchFail() {
        self.view?.showError()
    }
}
