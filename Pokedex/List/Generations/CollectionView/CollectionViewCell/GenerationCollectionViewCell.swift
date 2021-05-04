//
//  GenerationCollectionViewCell.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 29/4/21.
//

import UIKit

class GenerationCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelGeneration: UILabel!
    @IBOutlet weak var imageDots: UIImageView!
    @IBOutlet weak var viewImageDots: UIView!
    @IBOutlet weak var imagePokeball: UIImageView!
    @IBOutlet weak var viewImagePokeball: UIView!
    @IBOutlet weak var imageFirstPokemon: UIImageView!
    @IBOutlet weak var imageSecondPokemon: UIImageView!
    @IBOutlet weak var imageThirdPokemon: UIImageView!

    override class func awakeFromNib() {
        super.awakeFromNib()
    }

    func setlabel(name: String?) {
        if  var safeName = name {
            safeName = safeName.replacingOccurrences(of: "-", with: " ")
            labelGeneration.text = safeName.camelizedForPokemonGeneration
        }
    }

    func setSelectedCell(isSelected: Bool) {
        if isSelected {
            self.contentView.backgroundColor = UIColor(named: Constants.GenerationColors.generationsBackgroundSelected)
            self.labelGeneration.textColor = .white
        } else {
            self.contentView.backgroundColor = UIColor(named: Constants.GenerationColors.generationsBackground)
            self.labelGeneration.textColor = UIColor(named: Constants.GenerationColors.generationsTextColor)
            createGradientImage(viewImageDots, imageDots, UIColor(named: Constants.GenerationColors.generationsDotsImageStartColor)!, UIColor(named: Constants.GenerationColors.generationsDotsImageEndColor)!)
        }
        self.contentView.layer.cornerRadius = 10
    }

    func setImages(firstImage: UIImage,secondImage: UIImage,thirdImage: UIImage) {
        self.imageFirstPokemon.image = firstImage
        self.imageSecondPokemon.image = secondImage
        self.imageThirdPokemon.image = thirdImage
    }

    func createGradientImage(_ targetView : UIView,_ imageToGradient: UIImageView ,_ startColor: UIColor, _ endColor: UIColor  ) {
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = targetView.bounds
        gradientLayer.colors = [startColor.withAlphaComponent(1).cgColor, endColor.withAlphaComponent(0).cgColor, endColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        targetView.layer.addSublayer(gradientLayer)
        targetView.addSubview(imageToGradient)
        targetView.layer.mask = imageToGradient.layer
    }
}
