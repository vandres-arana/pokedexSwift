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

protocol ListViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: ListPresenterProtocol? { get set }
    func showPokemonList(list: GetAllPokemonsWithLimitQuery.Data)
    func showError()
}

protocol ListWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createListModule() -> UIViewController
}

protocol ListPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: ListViewProtocol? { get set }
    var interactor: ListInteractorInputProtocol? { get set }
    var wireFrame: ListWireFrameProtocol? { get set }
    func viewDidLoad()
    func startfetchingPokemonList()
    func fetchMorePokemons()
}

protocol ListInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func pokemonFetchSuccess(list: GetAllPokemonsWithLimitQuery.Data)
    func fetchMorePokemons()
    func pokemonFetchFail()
}

protocol ListInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: ListInteractorOutputProtocol? { get set }
    var localDatamanager: ListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ListRemoteDataManagerInputProtocol? { get set }
    func fetchPokemonList()
    func fetchMorePokemons()
}

protocol ListDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol ListRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ListRemoteDataManagerOutputProtocol? { get set }
    func fethPokemonList()
    func fetchMorePokemons()
}

protocol ListRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func fetchSuccess(list: GetAllPokemonsWithLimitQuery.Data)
    func fetchFail()
}

protocol ListLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
