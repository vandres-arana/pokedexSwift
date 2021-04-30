//
//  FiltersMenuInteractor.swift
//  Pokedex
//
//  Created by Victor Arana on 4/29/21.
//  
//

import Foundation

class FiltersMenuInteractor: FiltersMenuInteractorInputProtocol {
    
    var pokemonTypes: [Filter] = []
    var pokemonWeaknesses: [Filter] = []

    // MARK: Properties
    weak var presenter: FiltersMenuInteractorOutputProtocol?
    var localDatamanager: FiltersMenuLocalDataManagerInputProtocol?
    var remoteDatamanager: FiltersMenuRemoteDataManagerInputProtocol?
    
    func loadPokemonTypeList() {
        pokemonTypes = (localDatamanager?.loadPokemonTypeList())!
        pokemonWeaknesses = (localDatamanager?.loadPokemonTypeList())!
    }
    
    func getPokemonTypeFilterListCount() -> Int {
        return pokemonTypes.count
    }
    
    func getPokemonTypeFilterByIndex(index: Int, collection: Int) -> Filter {
        if collection == 0 {
            return pokemonTypes[index]
        } else {
            return pokemonWeaknesses[index]
        }
    }
    
    func markPokemonTypeFilterByIndex(index: Int, collection: Int) {
        if collection == 0 {
            pokemonTypes[index].isSelected = !pokemonTypes[index].isSelected
        } else {
            pokemonWeaknesses[index].isSelected = !pokemonWeaknesses[index].isSelected
        }
    }

}

extension FiltersMenuInteractor: FiltersMenuRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
