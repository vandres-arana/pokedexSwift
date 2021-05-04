//
//  GenerationsRemoteDataManagerTest.swift
//  PokedexTests
//
//  Created by Cristian Misael Almendro Lazarte on 3/5/21.
//

import XCTest
@testable import Pokedex

class GenerationsRemoteDataManagerTest: XCTestCase {
    var remoteDataManager: GenerationsRemoteDataManager?
    var generationsView: GenerationsView?
    
    override func setUpWithError() throws {
        remoteDataManager = GenerationsRemoteDataManager();
    }
    
    override func tearDownWithError() throws {
    }
    
    func testLoadPokemonTypeFilterList() throws {
        remoteDataManager?.externalRequestGenerationsNames()
        //generationsView.
    }
}
