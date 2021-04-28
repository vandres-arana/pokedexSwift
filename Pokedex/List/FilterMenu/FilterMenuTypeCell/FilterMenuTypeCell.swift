//
//  FilterMenuTypeCell.swift
//  Pokedex
//
//  Created by Victor Arana on 4/28/21.
//

import UIKit

class FilterMenuTypeCell: UICollectionViewCell {
    
    @IBOutlet var image: UIImageView!
    
    class var reuseIdentifier: String {
        return "FilterMenuTypeReuseIdentifier"
    }
    class var nibName: String {
        return "FilterMenuTypeCell"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(imageName: String) {
        image.image = #imageLiteral(resourceName: imageName)
    }
    
}
