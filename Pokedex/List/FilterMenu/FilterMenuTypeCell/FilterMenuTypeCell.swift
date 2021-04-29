//
//  FilterMenuTypeCell.swift
//  Pokedex
//
//  Created by Victor Arana on 4/28/21.
//

import UIKit

class FilterMenuTypeCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var imageViewBackground: UIImageView!
    
    class var reuseIdentifier: String {
        return "FilterMenuTypeReuseIdentifier"
    }
    class var nibName: String {
        return "FilterMenuTypeCell"
    }
    
    var pokemonType: PokemonType?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(_ pokemonType2: PokemonType) {
        self.pokemonType = pokemonType2
        imageView.image = #imageLiteral(resourceName: pokemonType2.name)
        imageView.tintColor = UIColor(named: pokemonType2.name)
        imageViewBackground.tintColor = .white
    }
    
    func invertColours() {
        if isSelected {
            imageView.tintColor = .white
            imageViewBackground.tintColor = UIColor(named: pokemonType!.name)
        } else {
            imageView.tintColor = UIColor(named: pokemonType!.name)
            imageViewBackground.tintColor = .white
        }
    }
    
    override var isSelected: Bool {
        didSet {
            invertColours()
        }
    }
    
}
