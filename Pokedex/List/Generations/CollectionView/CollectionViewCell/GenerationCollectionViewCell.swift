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
        super.awakeFromNib();
    }
    
    func setlabel(name: String) {
        label.text = name;
    }
    
}
