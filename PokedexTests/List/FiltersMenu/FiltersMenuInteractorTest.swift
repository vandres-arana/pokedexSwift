//
//  FiltersMenuInteractorTest.swift
//  PokedexTests
//
//  Created by Victor Arana on 5/1/21.
//

import XCTest
@testable import Pokedex

class FiltersMenuInteractorTest: XCTestCase {
    var interactor: FiltersMenuInteractor?

    override func setUpWithError() throws {
        let localDataManager: FiltersMenuLocalDataManagerInputProtocol = FiltersMenuLocalDataManager()
        interactor = FiltersMenuInteractor()
        interactor?.localDatamanager = localDataManager
        interactor?.loadPokemonFiltersList()
    }
    override func tearDownWithError() throws {
    }
    func testLoadPokemonFiltersLists() throws {
        XCTAssertEqual(interactor?.getPokemonFilterListCount(collectionFilterId: CollectionFilter.type), 18)
        XCTAssertEqual(interactor?.getPokemonFilterListCount(collectionFilterId: CollectionFilter.weakness), 18)
        XCTAssertEqual(interactor?.getPokemonFilterListCount(collectionFilterId: CollectionFilter.height), 3)
        XCTAssertEqual(interactor?.getPokemonFilterListCount(collectionFilterId: CollectionFilter.weight), 3)
    }
    func testGetPokemonFilterByIndex() throws {
        XCTAssertEqual(interactor?.getPokemonFilterByIndex(index: 0, collectionFilterId: CollectionFilter.type).name, interactor!.pokemonTypes[0].name)
    }
}
