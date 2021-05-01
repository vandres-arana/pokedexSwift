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
    }
    struct FiltersMenuCell {
        static let nibName = "FiltersMenuCollectionCell"
        static let reuseIdentifier = "FiltersMenuTypeReuseIdentifier"
    }
}
