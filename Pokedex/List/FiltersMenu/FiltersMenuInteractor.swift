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
    func getPokemonFilterListCount(collectionFilterId: CollectionFilter) -> Int {
        switch collectionFilterId {
        case CollectionFilter.type:
            return pokemonTypes.count
        case CollectionFilter.weakness:
            return pokemonWeaknesses.count
        case CollectionFilter.height:
            return pokemonHeights.count
        case CollectionFilter.weight:
            return pokemonWeights.count
        }
    }
    func getPokemonFilterByIndex(index: Int, collectionFilterId: CollectionFilter) -> Filter {
        switch collectionFilterId {
        case CollectionFilter.type:
            return pokemonTypes[index]
        case CollectionFilter.weakness:
            return pokemonWeaknesses[index]
        case CollectionFilter.height:
            return pokemonHeights[index]
        case CollectionFilter.weight:
            return pokemonWeights[index]
        }
    }
    func markPokemonFilterByIndex(index: Int, collectionFilterId: CollectionFilter) {
        switch collectionFilterId {
        case CollectionFilter.type:
            pokemonTypes[index].isSelected = !pokemonTypes[index].isSelected
        case CollectionFilter.weakness:
            pokemonWeaknesses[index].isSelected = !pokemonWeaknesses[index].isSelected
        case CollectionFilter.height:
            pokemonHeights[index].isSelected = !pokemonHeights[index].isSelected
        case CollectionFilter.weight:
            pokemonWeights[index].isSelected = !pokemonWeights[index].isSelected
        }
    }
    func resetFilters() {
        loadPokemonTypeList()
    }

}

extension FiltersMenuInteractor: FiltersMenuRemoteDataManagerOutputProtocol {
}
