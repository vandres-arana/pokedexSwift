//
//  DetailProtocols.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation
import UIKit

protocol DetailViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: DetailPresenterProtocol? { get set }
    func showPokemonLocation(evYield: String, catchRate: String, baseFriendship: String, baseExperience: String,growthRate: String)
    func showFailPokemonLocation()
}

protocol DetailWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createDetailModule(detailview: DetailView, data: GetAllPokemonsWithLimitQuery.Data.Pokemon)
}

protocol DetailPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorInputProtocol? { get set }
    var wireFrame: DetailWireFrameProtocol? { get set }
    var pokemon: GetAllPokemonsWithLimitQuery.Data.Pokemon? { get set }
    func fetchPokemonLocation()
    func viewDidLoad()
}

protocol DetailInteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func fetchSuccessPokemonLocation(evYield: String, catchRate: String, baseFriendship: String, baseExperience: String,growthRate: String)
    func fetchFailPokemonLocation()
}

protocol DetailInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: DetailInteractorOutputProtocol? { get set }
    var localDatamanager: DetailLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: DetailRemoteDataManagerInputProtocol? { get set }
    func fetchPokemonLocation(pokemonId: Int)
}

protocol DetailDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol DetailRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: DetailRemoteDataManagerOutputProtocol? { get set }
    /// You will fetch all pokemon location by pokemon ID
    func fetchPokemonTraining(pokemonId: Int)
}

protocol DetailRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    /// Fetch was done successfully, ready to pass to the interactor
    /// - Parameter pokemonLocations: a list of all the pokemon locations
    func fetchSuccessPokemonLocation(evYield: String, catchRate: String, baseFriendship: String, baseExperience: String,growthRate: String)
    /// Something wrong happened when retrieving the pokemon location
    func fetchFailPokemonLocation()
}

protocol DetailLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
