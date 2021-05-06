//
//  ListInteractor.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation
import Apollo

class ListInteractor: ListInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: ListInteractorOutputProtocol?
    var localDatamanager: ListLocalDataManagerInputProtocol?
    var remoteDatamanager: ListRemoteDataManagerInputProtocol?
    func fetchPokemonList() {
        remoteDatamanager?.fethPokemonList()
    }
    func fetchMorePokemons() {
        remoteDatamanager?.fetchMorePokemons()
    }
}

extension ListInteractor: ListRemoteDataManagerOutputProtocol {
    func fetchSuccess(list: GetAllPokemonsWithLimitQuery.Data) {
        presenter?.pokemonFetchSuccess(list: list)
    }
    func fetchFail() {
        presenter?.pokemonFetchFail()
    }
}
