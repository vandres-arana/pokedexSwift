//
//  Generation.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 29/4/21.
//

import Foundation
import RealmSwift

class Generation: Object {
    
    @objc dynamic var idGeneration: String?
    @objc dynamic var name: String?
}
