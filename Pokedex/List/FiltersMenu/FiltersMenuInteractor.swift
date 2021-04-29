//
//  FiltersMenuInteractor.swift
//  Pokedex
//
//  Created by Victor Arana on 4/29/21.
//  
//

import Foundation

class FiltersMenuInteractor: FiltersMenuInteractorInputProtocol {
    
    var pokemonTypes: [PokemonType] = []
    var pokemonWeaknesses: [PokemonType] = []

    // MARK: Properties
    weak var presenter: FiltersMenuInteractorOutputProtocol?
    var localDatamanager: FiltersMenuLocalDataManagerInputProtocol?
    var remoteDatamanager: FiltersMenuRemoteDataManagerInputProtocol?
    
    func loadPokemonTypeList() {
        pokemonTypes = (localDatamanager?.loadPokemonTypeList())!
        pokemonWeaknesses = (localDatamanager?.loadPokemonTypeList())!
    }
    
    func getPokemonTypeListCount() -> Int {
        return pokemonTypes.count
    }
    
    func getPokemonTypeByIndex(index: Int, collection: Int) -> PokemonType {
        if collection == 0 {
            return pokemonTypes[index]
        } else {
            return pokemonWeaknesses[index]
        }
    }
    
    func markPokemonTypeByIndex(index: Int, collection: Int) {
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
