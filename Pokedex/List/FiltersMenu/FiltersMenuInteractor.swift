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
    
    func getPokemonFilterListCount() -> Int {
        return pokemonTypes.count
    }
    
    func getPokemonFilterByIndex(index: Int, filterId: Int) -> Filter {
        if filterId == 0 {
            return pokemonTypes[index]
        } else {
            return pokemonWeaknesses[index]
        }
    }
    
    func markPokemonFilterByIndex(index: Int, filterId: Int) {
        if filterId == 0 {
            pokemonTypes[index].isSelected = !pokemonTypes[index].isSelected
        } else {
            pokemonWeaknesses[index].isSelected = !pokemonWeaknesses[index].isSelected
        }
    }

}

extension FiltersMenuInteractor: FiltersMenuRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
