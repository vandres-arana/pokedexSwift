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
    var pokemonHeights: [Filter] = []
    var pokemonWeights: [Filter] = []

    // MARK: Properties
    weak var presenter: FiltersMenuInteractorOutputProtocol?
    var localDatamanager: FiltersMenuLocalDataManagerInputProtocol?
    var remoteDatamanager: FiltersMenuRemoteDataManagerInputProtocol?
    
    func loadPokemonTypeList() {
        pokemonTypes = (localDatamanager?.loadPokemonTypeFilterList())!
        pokemonWeaknesses = (localDatamanager?.loadPokemonTypeFilterList())!
        pokemonHeights = (localDatamanager?.loadPokemonHeightFilterList())!
        pokemonWeights = (localDatamanager?.loadPokemonWeightFilterList())!
    }
    
    func getPokemonFilterListCount(filterId: Int) -> Int {
        switch filterId {
        case 0:
            return pokemonTypes.count
        case 1:
            return pokemonWeaknesses.count
        case 2:
            return pokemonHeights.count
        case 3:
            return pokemonWeights.count
        default:
            return 0
        }
    }
    
    func getPokemonFilterByIndex(index: Int, filterId: Int) -> Filter {
        switch filterId {
        case 0:
            return pokemonTypes[index]
        case 1:
            return pokemonWeaknesses[index]
        case 2:
            return pokemonHeights[index]
        default:
            return pokemonWeights[index]
        }
    }
    
    func markPokemonFilterByIndex(index: Int, filterId: Int) {
        switch filterId {
        case 0:
            pokemonTypes[index].isSelected = !pokemonTypes[index].isSelected
        case 1:
            pokemonWeaknesses[index].isSelected = !pokemonWeaknesses[index].isSelected
        case 2:
            pokemonHeights[index].isSelected = !pokemonHeights[index].isSelected
        default:
            pokemonWeights[index].isSelected = !pokemonWeights[index].isSelected
        }
    }
    
    func resetFilters() {
        loadPokemonTypeList()
    }

}

extension FiltersMenuInteractor: FiltersMenuRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
