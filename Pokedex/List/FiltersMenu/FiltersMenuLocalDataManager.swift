//
//  FiltersMenuLocalDataManager.swift
//  Pokedex
//
//  Created by Victor Arana on 4/29/21.
//  
//

import Foundation

class FiltersMenuLocalDataManager:FiltersMenuLocalDataManagerInputProtocol {
    let pokemonTypes = ["bug", "dark", "dragon", "electric", "fairy", "fighting", "fire", "flying", "ghost", "grass", "ground", "ice", "normal", "poison", "psychic", "rock", "steel", "water"]
    let pokemonHeights = ["short", "medium", "tall"]
    let pokemonWeights = ["light", "normalW", "heavy"]
    func loadPokemonTypeFilterList() -> [Filter] {
        return pokemonTypes.map { Filter($0) }
    }
    func loadPokemonHeightFilterList() -> [Filter] {
        return pokemonHeights.map { Filter($0) }
    }
    func loadPokemonWeightFilterList() -> [Filter] {
        return pokemonWeights.map { Filter($0) }
    }
}
