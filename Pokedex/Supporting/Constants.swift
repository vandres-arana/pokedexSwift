//
//  Constants.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 23/4/21.
//

import Foundation

struct Constants {
    struct StoryBoard {
        static let listViewStoryBoardID = "ListView"
        static let detailViewStoryBoardID = "DetailView"
        static let filtersViewStoryBoardID = "FiltersMenuView"
        static let generationsViewStoryBoardID = "GenerationsView"
    }
    struct PokeApi {
        static let graphqlURL = "https://beta.pokeapi.co/graphql/v1beta"
        static let baseURL = "https://pokeapi.co/api/v2/"
    }
    struct FiltersMenuCell {
        static let nibName = "FiltersMenuCollectionCell"
        static let reuseIdentifier = "FiltersMenuTypeReuseIdentifier"
    }
    struct FiltersMenuValues {
        static let pokemonTypes = ["bug", "dark", "dragon", "electric", "fairy", "fighting", "fire", "flying", "ghost", "grass", "ground", "ice", "normal", "poison", "psychic", "rock", "steel", "water"]
        static let pokemonHeights = ["short", "medium", "tall"]
        static let pokemonWeights = ["light", "normalW", "heavy"]
    }
    struct GenerationCell {
        static let nibName = "GenerationCollectionViewCell"
        static let reuseIdentifier = "GenerationReusableCell"
    }
    struct GenerationColors {
        static let dotsImageStartColor = "GenerationsDotsImageStartColor"
        static let dotsImageEndColor = "GenerationsDotsImageEndColor"
        static let pokeballImageStartColor = "GenerationsPokeballImageStartColor"
        static let pokeballImageEndColor = "GenerationsPokeballImageEndColor"
        static let backgroundSelected = "GenerationsBackgroundSelected"
        static let background = "GenerationsBackground"
        static let textColor = "GenerationsTextColor"
    }
}
