//
//  ListPokeApiService.swift
//  Pokedex
//
//  Created by Victor Arana on 4/25/21.
//

import Foundation
import Apollo

class PokeApiService {
  static let shared = PokeApiService()
    private(set) lazy var apollo = ApolloClient(url: URL(string: Constants.PokeApi.graphqlURL)!)
}
