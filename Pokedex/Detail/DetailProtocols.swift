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
    func showPokemonTraining(evYield: String, catchRate: String, baseFriendship: String, baseExperience: String,growthRate: String)
    func showFailPokemonTraining()
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
    func fetchPokemonTraining()
    func viewDidLoad()
}

protocol DetailInteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func fetchSuccessPokemonTraining(evYield: String, catchRate: String, baseFriendship: String, baseExperience: String,growthRate: String)
    func fetchFailPokemonTraining()
}

protocol DetailInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: DetailInteractorOutputProtocol? { get set }
    var localDatamanager: DetailLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: DetailRemoteDataManagerInputProtocol? { get set }
    func fetchPokemonTraining(pokemonId: Int)
}

protocol DetailDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol DetailRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: DetailRemoteDataManagerOutputProtocol? { get set }
    /// You will fetch all pokemon training by pokemon ID
    func fetchPokemonTraining(pokemonId: Int)
}

protocol DetailRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    /// Fetch was done successfully, ready to pass to the interactor
    /// - Parameter pokemonTraining: a list of all the pokemon training
    func fetchSuccessPokemonTraining(evYield: String, catchRate: String, baseFriendship: String, baseExperience: String,growthRate: String)
    /// Something wrong happened when retrieving the pokemon training
    func fetchFailPokemonTraining()
}

protocol DetailLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
