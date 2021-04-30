//
//  FiltersMenuLocalDataManager.swift
//  Pokedex
//
//  Created by Victor Arana on 4/29/21.
//  
//

import Foundation

class FiltersMenuLocalDataManager:FiltersMenuLocalDataManagerInputProtocol {
    func loadPokemonTypeFilterList() -> [Filter] {
        return [Filter("bug"), Filter("dark"), Filter("dragon"), Filter("electric"), Filter("fairy"), Filter("fighting"), Filter("fire"), Filter("flying"), Filter("ghost"), Filter("grass"), Filter("ground"), Filter("ice"), Filter("normal"), Filter("poison"), Filter("psychic"), Filter("rock"), Filter("steel"), Filter("water")]
    }
    
    func loadPokemonHeightFilterList() -> [Filter] {
        return [Filter("short"), Filter("medium"), Filter("tall")]
    }
    
    func loadPokemonWeightFilterList() -> [Filter] {
        return [Filter("light"), Filter("normal"), Filter("Heavy")]
    }
    
}
