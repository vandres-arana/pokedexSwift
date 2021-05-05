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
    }
    struct PokeApi {
        static let graphqlURL = "https://beta.pokeapi.co/graphql/v1beta"
        static let baseURL = "https://pokeapi.co/api/v2/"
        static let imageURL = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/"
    }
    struct CellView {
        static let cellIdentifier = "Cell"
    }
}
