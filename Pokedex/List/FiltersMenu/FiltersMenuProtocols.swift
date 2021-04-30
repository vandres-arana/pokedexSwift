//
//  FiltersMenuProtocols.swift
//  Pokedex
//
//  Created by Victor Arana on 4/29/21.
//  
//

import Foundation
import UIKit

protocol FiltersMenuViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: FiltersMenuPresenterProtocol? { get set }
}

protocol FiltersMenuWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createFiltersMenuModule() -> UIViewController
}

protocol FiltersMenuPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: FiltersMenuViewProtocol? { get set }
    var interactor: FiltersMenuInteractorInputProtocol? { get set }
    var wireFrame: FiltersMenuWireFrameProtocol? { get set }
    
    func viewDidLoad()
    
    func getPokemonTypeFilterListLength() -> Int
    
    func getPokemonTypeFilterByIndex(index: Int, collection: Int) -> Filter
    
    func markPokemonTypeFilterByIndex(index: Int, collection: Int)
}

protocol FiltersMenuInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol FiltersMenuInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: FiltersMenuInteractorOutputProtocol? { get set }
    var localDatamanager: FiltersMenuLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: FiltersMenuRemoteDataManagerInputProtocol? { get set }
    
    func loadPokemonTypeList()
    
    func getPokemonTypeFilterListCount() -> Int
    
    func getPokemonTypeFilterByIndex(index: Int, collection: Int) -> Filter
    
    func markPokemonTypeFilterByIndex(index: Int, collection: Int)
}

protocol FiltersMenuDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol FiltersMenuRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: FiltersMenuRemoteDataManagerOutputProtocol? { get set }
}

protocol FiltersMenuRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol FiltersMenuLocalDataManagerInputProtocol: AnyObject {
    func loadPokemonTypeList() -> [Filter]
    // INTERACTOR -> LOCALDATAMANAGER
}
