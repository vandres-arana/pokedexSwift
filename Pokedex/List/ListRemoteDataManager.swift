//
//  ListRemoteDataManager.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation
import Apollo

class ListRemoteDataManager:ListRemoteDataManagerInputProtocol {
    var limit = 20
    var remoteRequestHandler: ListRemoteDataManagerOutputProtocol?
    func fethPokemonList() {
        PokeApiService.shared.apollo.fetch(query: GetAllPokemonsWithLimitQuery(limit: limit)) { (result) in
            switch result {
            case .success(let list):
                self.remoteRequestHandler?.fetchSuccess(list: list.data!)
            case .failure(let error):
                print(error)
                self.remoteRequestHandler?.fetchFail()
            }
        }
    }
    func fetchMorePokemons() {
        limit+=20
        PokeApiService.shared.apollo.fetch(query: GetAllPokemonsWithLimitQuery(limit: limit)) { (result) in
            switch result {
            case .success(let list):
                self.remoteRequestHandler?.fetchSuccess(list: list.data!)
            case .failure(let error):
                print(error)
                self.remoteRequestHandler?.fetchFail()
            }
        }
    }
}
