//
//  GenerationsRemoteDataManagerTest.swift
//  PokedexTests
//
//  Created by Cristian Misael Almendro Lazarte on 3/5/21.
//

import XCTest
@testable import Pokedex

class GenerationsRemoteDataManagerTest: XCTestCase {
    var generationsView: GenerationsView?
    var generationsPresenter: GenerationsPresenter?
    var generationsInteractor: GenerationsInteractor?
    var remoteDataManager: GenerationsRemoteDataManager?

    override func setUpWithError() throws {
        generationsView = GenerationsView()
        generationsPresenter = GenerationsPresenter()
        generationsInteractor = GenerationsInteractor()
        remoteDataManager = GenerationsRemoteDataManager()
        try super.setUpWithError()
    }
    override func tearDownWithError() throws {
        generationsView = nil
        generationsPresenter = nil
        generationsInteractor = nil
        remoteDataManager = nil
        try super.tearDownWithError()
    }

    func testLoadPokemonTypeFilterList() throws {
        remoteDataManager?.externalRequestGenerationsNames()
        let data : [GetGenerationsQuery.Data.Generation] = [GetGenerationsQuery.Data.Generation]()
        generationsInteractor?.getGenerationNames(receivedData: data)
        XCTAssertEqual(data.count, 8)
    }
}
