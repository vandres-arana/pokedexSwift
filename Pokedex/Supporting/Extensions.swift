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
extension String {
    /// will uppercase the frist letter of your string
    var uppercasingFirst: String {
        return prefix(1).uppercased() + dropFirst()
    }
    /// will lowercase the First letter of your string
    var lowercasingFirst: String {
        return prefix(1).lowercased() + dropFirst()
    }

    var camelized: String {
        guard !isEmpty else {
            return ""
        }

        let parts = self.components(separatedBy: " ")

        let first = String(describing: parts.first!).uppercasingFirst
        let rest = parts.dropFirst().map({String($0).uppercased()})

        return ([first] + rest).joined(separator: " ")
    }
    /// will Camelcase your string separated by dashes
    var camelizedDash: String {
        guard !isEmpty else {
            return ""
        }

        let parts = self.components(separatedBy: "-")

        let first = String(describing: parts.first!).uppercasingFirst
        let rest = parts.dropFirst().map({String($0).uppercasingFirst})

        return ([first] + rest).joined(separator: " ")
    }
}
