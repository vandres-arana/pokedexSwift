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
    func fetchPokemonTraining(pokemonId: Int) {
        remoteDatamanager?.fetchPokemonTraining(pokemonId: pokemonId)
    }
}

extension DetailInteractor: DetailRemoteDataManagerOutputProtocol {
    func fetchSuccessPokemonTraining(evYield: String, catchRate: String, baseFriendship: String, baseExperience: String, growthRate: String) {
        presenter?.fetchSuccessPokemonTraining(evYield: evYield, catchRate: catchRate, baseFriendship: baseFriendship, baseExperience: baseExperience, growthRate: growthRate)
    }
    func fetchFailPokemonTraining() {
        presenter?.fetchFailPokemonTraining()
    }
    // TODOs: Implement use case methods
}
