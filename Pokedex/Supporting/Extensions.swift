//
//  Extensions.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 3/5/21.
//

import Foundation

extension String {
    var uppercasingFirst: String {
        return prefix(1).uppercased() + dropFirst()
    }

    var lowercasingFirst: String {
        return prefix(1).lowercased() + dropFirst()
    }

    var camelized: String {
        guard !isEmpty else {
            return ""
        }

        let parts = self.components(separatedBy: " ")

        let first = String(describing: parts.first!).lowercasingFirst
        let rest = parts.dropFirst().map({String($0).uppercasingFirst})

        return ([first] + rest).joined(separator: " ")
    }

    var camelizedForPokemonGeneration: String {
        guard !isEmpty else {
            return ""
        }

        let parts = self.components(separatedBy: " ")

        let first = String(describing: parts.first!).uppercasingFirst
        let rest = parts.dropFirst().map({String($0).uppercased()})

        return ([first] + rest).joined(separator: " ")
    }
}
