//
//  SortMenuPresenterTest.swift
//  PokedexTests
//
//  Created by user on 5/5/21.
//

import XCTest
@testable import Pokedex

class SortMenuPresenterTest: XCTestCase {
    var sortMenuPresenter : SortMenuPresenter?
    override func setUpWithError() throws {
        sortMenuPresenter = SortMenuPresenter()
    }

    override func tearDownWithError() throws {
       sortMenuPresenter = nil
    }

    func testUpgradeSortMethod() throws {
        let sortMethod = sortMenuPresenter?.applySort(sort: "Highest number first")
        XCTAssertEqual(sortMethod, "Highest number first")
    }
    func testSelectedSortSmallestFirstsMethod() throws {
        let sortMethod = sortMenuPresenter?.sendSelectedSort(type: 1)
        XCTAssertEqual(sortMethod, "asc")
    }
    func testSelectedSortHighestFirstMethod() throws {
        let sortMethod = sortMenuPresenter?.sendSelectedSort(type: 2)
        XCTAssertEqual(sortMethod, "dsc")
    }
    func testSelectedSortAZMethod() throws {
        let sortMethod = sortMenuPresenter?.sendSelectedSort(type: 3)
        XCTAssertEqual(sortMethod, "az")
    }
    func testSelectedSortZAMethod() throws {
        let sortMethod = sortMenuPresenter?.sendSelectedSort(type: 4)
        XCTAssertEqual(sortMethod, "za")
    }

}
