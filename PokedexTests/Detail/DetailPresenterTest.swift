//
// DetailPresenterTest.swift
// PokedexTests
// Created by Christian Torrico Avila on 5/16/21.
// @locoto
//

import XCTest
@testable import Pokedex

class DetailPresenterTest: XCTestCase {

    var presenter: DetailPresenter?
    var view: MockDetailView?
    override func setUpWithError() throws {
        presenter = DetailPresenter()
        view = MockDetailView()
        presenter?.view = self.view
    }

    override func tearDownWithError() throws {
        presenter = nil
        view = nil
    }
    func testFetchPokemonLocation() throws {
        presenter?.fetchSuccessPokemonLocation(evYield: "1 Speed", catchRate: "45", baseFriendship: "70", baseExperience: "90", growthRate: "medium-slow")
        XCTAssertTrue(view?.loading ?? false)
    }
    func testFetchPokemonLocationFailed() throws {
        presenter?.fetchFailPokemonLocation()
        XCTAssertTrue(view?.loading ?? false)
    }
}

class MockDetailView: DetailViewProtocol {
    var presenter: DetailPresenterProtocol?
    var loading = false
    func showPokemonLocation(evYield: String, catchRate: String, baseFriendship: String, baseExperience: String, growthRate: String) {
        // This means that the fetch was done successfully and there is a correct communication between
        // The View and the Presenter
        self.loading = true
    }
    func showFailPokemonLocation() {
        self.loading = true
    }
}
