//
//  GenerationCollectionViewCell.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 29/4/21.
//

import UIKit

class GenerationCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    func setlabel(name: String?) {
        if  var safeName = name {
            safeName = safeName.replacingOccurrences(of: "-", with: " ")
            label.text = safeName.camelizedForGeneration
        }
    }
}

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

    var camelizedForGeneration: String {
        guard !isEmpty else {
            return ""
        }

        let parts = self.components(separatedBy: " ")

        let first = String(describing: parts.first!).uppercasingFirst
        let rest = parts.dropFirst().map({String($0).uppercased()})

        return ([first] + rest).joined(separator: " ")
    }
}
