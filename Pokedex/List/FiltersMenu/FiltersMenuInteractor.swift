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
    func loadPokemonFiltersList() {
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
    func getPokemonFilterByIndex(index: Int, collectionFilterId: CollectionFilter) throws -> Filter {
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
    func markPokemonFilterByIndex(index: Int, collectionFilterId: CollectionFilter) throws {
        switch collectionFilterId {
        case CollectionFilter.type:
            pokemonTypes[index].select()
        case CollectionFilter.weakness:
            pokemonWeaknesses[index].select()
        case CollectionFilter.height:
            pokemonHeights[index].select()
        case CollectionFilter.weight:
            pokemonWeights[index].select()
        }
    }
    func resetFilters() {
        loadPokemonFiltersList()
    }

}

extension FiltersMenuInteractor: FiltersMenuRemoteDataManagerOutputProtocol {
}
