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
}
