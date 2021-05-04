//
//  ListProtocols.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation
import UIKit
import Apollo

protocol ListViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: ListPresenterProtocol? { get set }
    func showPokemonList(list: GetAllPokemonsWithLimitQuery.Data)
    func showError()
}

protocol ListWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createListModule() -> UIViewController
}

protocol ListPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: ListViewProtocol? { get set }
    var interactor: ListInteractorInputProtocol? { get set }
    var wireFrame: ListWireFrameProtocol? { get set }
    func viewDidLoad()
    func startfetchingPokemonList()
    func fetchMorePokemons()
}

protocol ListInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
    func pokemonFetchSuccess(list: GetAllPokemonsWithLimitQuery.Data)
    func fetchMorePokemons()
    func pokemonFetchFail()
}

protocol ListInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: ListInteractorOutputProtocol? { get set }
    var localDatamanager: ListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ListRemoteDataManagerInputProtocol? { get set }
    func fetchPokemonList()
    func fetchMorePokemons()
}

protocol ListDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol ListRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ListRemoteDataManagerOutputProtocol? { get set }
    func fethPokemonList()
    func fetchMorePokemons()
}

protocol ListRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func fetchSuccess(list: GetAllPokemonsWithLimitQuery.Data)
    func fetchFail()
}

protocol ListLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
