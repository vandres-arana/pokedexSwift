//
//  GenerationCollectionViewCell.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 26/4/21.
//

import UIKit

class GenerationCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var View: UIView!
    @IBOutlet weak var pokeball: UIImageView!
    
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var thirdImage: UIImageView!
    
    @IBOutlet weak var generationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
