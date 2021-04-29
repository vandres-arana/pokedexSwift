//
//  FiltersMenuLocalDataManager.swift
//  Pokedex
//
//  Created by Victor Arana on 4/29/21.
//  
//

import Foundation

class FiltersMenuLocalDataManager:FiltersMenuLocalDataManagerInputProtocol {
    func loadPokemonTypeList() -> [PokemonType] {
        return [PokemonType("bug"), PokemonType("dark"), PokemonType("dragon"), PokemonType("electric"), PokemonType("fairy"), PokemonType("fighting"), PokemonType("fire"), PokemonType("flying"), PokemonType("ghost"), PokemonType("grass"), PokemonType("ground"), PokemonType("ice"), PokemonType("normal"), PokemonType("poison"), PokemonType("psychic"), PokemonType("rock"), PokemonType("steel"), PokemonType("water")]
    }
    
}
