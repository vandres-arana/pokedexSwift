//
//  DetailPresenter.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation

class DetailPresenter {
    // MARK: Properties
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var wireFrame: DetailWireFrameProtocol?
    var pokemon: GetAllPokemonsWithLimitQuery.Data.Pokemon?
}

extension DetailPresenter: DetailPresenterProtocol {
    func viewDidLoad() {
    }
    func fetchPokemonTraining() {
        if let safeId = pokemon?.id {
            interactor?.fetchPokemonTraining(pokemonId: safeId)
        }
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    func fetchSuccessPokemonTraining(evYield: String, catchRate: String, baseFriendship: String, baseExperience: String, growthRate: String) {
        view?.showPokemonTraining(evYield: evYield, catchRate: catchRate, baseFriendship: baseFriendship, baseExperience: baseExperience, growthRate: growthRate)
    }
    func fetchFailPokemonTraining() {
        view?.showFailPokemonTraining()
    }
}
