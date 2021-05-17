//
//  DetailRemoteDataManager.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//
import Foundation
import Apollo

class DetailRemoteDataManager:DetailRemoteDataManagerInputProtocol {
    var remoteRequestHandler: DetailRemoteDataManagerOutputProtocol?
    func fetchPokemonTraining(pokemonId: Int) {
        PokeApiService.shared.apollo.fetch(query: GetPokemonDetailQuery(_eq: pokemonId)) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data?.pokemonV2Pokemonspecies.compactMap({$0}) {
                    guard let baseExperience = data[0].baseHappiness else {return}
                    guard let growthRate = data[0].pokemonV2Growthrate?.name else {return}
                    guard let baseFiendship = data[0].baseHappiness else {return}
                    guard let catchRate = data[0].captureRate else {return}
                    let evYield = self.getEvYield(pokemonStats: data[0].pokemonV2Pokemons[0].pokemonV2Pokemonstats)
                    self.remoteRequestHandler?.fetchSuccessPokemonLocation(evYield: String(evYield), catchRate: String(catchRate), baseFriendship: String(baseFiendship), baseExperience: String(baseExperience), growthRate: String(growthRate))
                }
            case .failure(let error):
                print("failed to bring the training data")
                print(error)
                self.remoteRequestHandler?.fetchFailPokemonLocation()
            }
        }
    }
    func getEvYield(pokemonStats: [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemon.PokemonV2Pokemonstat]) -> String {
        var evYields: String = ""
        for index in 0..<pokemonStats.count {
            if pokemonStats[index].effort > 0 {
                if !evYields.isEmpty {
                    evYields += "\n"
                }
                evYields += "\(pokemonStats[index].effort) \(String(pokemonStats[index].pokemonV2Stat!.name))"
            }
        }
        return evYields
    }
}
