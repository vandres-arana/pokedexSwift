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
        static let officialArtworkImageURL = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/"
    }
    struct CellView {
        static let cellIdentifier = "Cell"
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
    struct PokemonCell {
        static let cellIdentifier = "CustomPokemonTableViewCell"
    }
    struct PokemonColor {
        static let textColorId = "textColorId"
        static let backgroundPattern = "back-pattern"
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
    struct GenerationPokemons {
        static let firstGenerationFire = "004"
        static let firstGenerationGrass = "001"
        static let firstGenerationWater = "007"
        static let secondGenerationFire = "155"
        static let secondGenerationGrass = "152"
        static let secondGenerationWater = "158"
        static let thirdGenerationFire = "255"
        static let thirdGenerationGrass = "252"
        static let thirdGenerationWater = "258"
        static let fourthGenerationFire = "390"
        static let fourthGenerationGrass = "387"
        static let fourthGenerationWater = "393"
        static let fifthGenerationFire = "498"
        static let fifthGenerationGrass = "495"
        static let fifthGenerationWater = "501"
        static let sixthGenerationFire = "653"
        static let sixthGenerationGrass = "650"
        static let sixthGenerationWater = "656"
        static let seventhGenerationFire = "725"
        static let seventhGenerationGrass = "722"
        static let seventhGenerationWater = "728"
        static let eightGenerationFire = "813"
        static let eightGenerationGrass = "810"
        static let eightGenerationWater = "816"
    }
}
