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
    func fetchPokemonLocation() {
        if let safePokemonId = pokemon?.id {
            interactor?.fetchPokemonLocation(pokemonId: safePokemonId)
        }
    }
    func viewDidLoad() {
    }
    func fetchPokemonTraining() {
        if let safePokemonId = pokemon?.id {
            interactor?.fetchPokemonTraining(pokemonId: safePokemonId)
        }
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    func fetchSuccessPokemonLocation(pokemonLocations: [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemondexnumber]) {
        view?.showPokemonLocation(pokemonLocations: pokemonLocations)
    }
    func fetchFailPokemonLocation() {
        view?.showFailPokemonLocation()
    }
    func fetchSuccessPokemonTraining(evYield: String, catchRate: String, baseFriendship: String, baseExperience: String, growthRate: String) {
        view?.showPokemonTraining(evYield: evYield, catchRate: catchRate, baseFriendship: baseFriendship, baseExperience: baseExperience, growthRate: growthRate)
    }
    func fetchFailPokemonTraining() {
        view?.showFailPokemonTraining()
    }
}
