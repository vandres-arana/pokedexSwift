//
//  Extensions.swift
//  Pokedex
//
//  Created by user on 4/30/21.
//

import Foundation
import Apollo
import Kingfisher

extension GetAllPokemonsWithLimitQuery.Data.Pokemon {
    func getImageUrl() -> URL? {
        let urlStr = "\(Constants.PokeApi.officialArtworkImageURL)\(self.id).png"
        let url = URL(string: urlStr)!
        return url
    }
    func getTypesList() -> [String] {
        var typeList: [String] = []
        for type in self.types {
            typeList.append(type.pokemonV2Type!.name)
        }
        return typeList
    }
}
