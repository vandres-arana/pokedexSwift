//
//  ListInteractor.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation

class ListInteractor: ListInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: ListInteractorOutputProtocol?
    var localDatamanager: ListLocalDataManagerInputProtocol?
    var remoteDatamanager: ListRemoteDataManagerInputProtocol?
    
    func fetchPokemonList() {
        PokeApiService.shared.apollo.fetch(query: GetAllPokemonsWithLimitQuery(limit: 10)) { (result) in
            self.presenter?.PokemonFetchSuccess(result: result)
        }
    }

}

extension ListInteractor: ListRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
