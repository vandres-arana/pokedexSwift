//
//  PokemonTypeCollectionViewCell.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 14/5/21.
//

import UIKit

class PokemonTypeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var typePokemonImage: UIImageView!
    @IBOutlet weak var damageLabel: UILabel!
    @IBOutlet weak var backgroundColorView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func buildCell(image: UIImage, damage: String, backgroundColor: UIColor) {
        self.typePokemonImage.image = image
        self.damageLabel.text = damage
        self.backgroundColorView.backgroundColor = backgroundColor
    }

}
