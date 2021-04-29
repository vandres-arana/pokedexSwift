//
//  FiltersMenuInteractor.swift
//  Pokedex
//
//  Created by Victor Arana on 4/29/21.
//  
//

import Foundation

class FiltersMenuInteractor: FiltersMenuInteractorInputProtocol {
    
    let pokemonTypes = [PokemonType("bug"), PokemonType("dark"), PokemonType("dragon"), PokemonType("electric"), PokemonType("fairy"), PokemonType("fighting"),
                 PokemonType("fire"), PokemonType("flying"), PokemonType("ghost"), PokemonType("grass"), PokemonType("ground"), PokemonType("ice"),
                 PokemonType("normal"), PokemonType("poison"), PokemonType("psychic"), PokemonType("rock"), PokemonType("steel"), PokemonType("water")]
    let pokemonWeaknesses = [PokemonType("bug"), PokemonType("dark"), PokemonType("dragon"), PokemonType("electric"), PokemonType("fairy"), PokemonType("fighting"),
                 PokemonType("fire"), PokemonType("flying"), PokemonType("ghost"), PokemonType("grass"), PokemonType("ground"), PokemonType("ice"),
                 PokemonType("normal"), PokemonType("poison"), PokemonType("psychic"), PokemonType("rock"), PokemonType("steel"), PokemonType("water")]

    // MARK: Properties
    weak var presenter: FiltersMenuInteractorOutputProtocol?
    var localDatamanager: FiltersMenuLocalDataManagerInputProtocol?
    var remoteDatamanager: FiltersMenuRemoteDataManagerInputProtocol?
    
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
