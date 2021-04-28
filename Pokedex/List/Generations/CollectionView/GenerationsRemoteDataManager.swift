//
//  GenerationsRemoteDataManager.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 28/4/21.
//  
//

import Foundation

class GenerationsRemoteDataManager:GenerationsRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: GenerationsRemoteDataManagerOutputProtocol?
    
    func getGenerations(){
        PokeApiService.shared.apollo.fetch(query: GetGenerationsQuery()) { result in
            switch result {
            case .success(let getGenerationsQuery) :
                self.remoteRequestHandler?.getGenerationNames(generations: getGenerationsQuery.data!.generations);
                break;
            case .failure(let error) :
                print(error);
                break;
            }
        }
    }
}
