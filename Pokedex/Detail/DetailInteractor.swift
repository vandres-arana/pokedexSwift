//
//  DetailInteractor.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation

class DetailInteractor: DetailInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: DetailInteractorOutputProtocol?
    var localDatamanager: DetailLocalDataManagerInputProtocol?
    var remoteDatamanager: DetailRemoteDataManagerInputProtocol?
    func fetchPokemonLocation(pokemonId: Int) {
        remoteDatamanager?.fetchPokemonTraining(pokemonId: pokemonId)
    }
}

extension DetailInteractor: DetailRemoteDataManagerOutputProtocol {
    func fetchSuccessPokemonLocation(evYield: String, catchRate: String, baseFriendship: String, baseExperience: String, growthRate: String) {
        presenter?.fetchSuccessPokemonLocation(evYield: evYield, catchRate: catchRate, baseFriendship: baseFriendship, baseExperience: baseExperience, growthRate: growthRate)
    }
    func fetchFailPokemonLocation() {
        presenter?.fetchFailPokemonLocation()
    }
    // TODOs: Implement use case methods
}
