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

    func setImages(firstImage: UIImage,secondImage: UIImage,thirdImage: UIImage) {
        self.imageFirstPokemon.image = firstImage
        self.imageSecondPokemon.image = secondImage
        self.imageThirdPokemon.image = thirdImage
    }

    func setSelectedCell(isSelected: Bool) {
        if isSelected {
            self.contentView.backgroundColor = UIColor(named: Constants.GenerationColors.backgroundSelected)
            self.labelGeneration.textColor = .white
        } else {
            self.contentView.backgroundColor = UIColor(named: Constants.GenerationColors.background)
            self.labelGeneration.textColor = UIColor(named: Constants.GenerationColors.textColor)
            createGradientImage(viewImageDots, imageDots, UIColor(named: Constants.GenerationColors.dotsImageStartColor)!, UIColor(named: Constants.GenerationColors.dotsImageEndColor)!,1, 0,CGPoint(x: 0.0, y: 0.0),CGPoint(x: 1.0,y: 0))
            self.labelGeneration.textColor = UIColor(named: Constants.GenerationColors.textColor)
            createGradientImage(viewImagePokeball, imagePokeball, UIColor(named: Constants.GenerationColors.pokeballImageStartColor)!, UIColor(named: Constants.GenerationColors.pokeballImageEndColor)!,0.1, 0,CGPoint(x: 0.0, y: 0.0),CGPoint(x: 0.0,y: 1.0))
        }
        self.contentView.layer.cornerRadius = 10
    }

    func createGradientImage(_ targetView : UIView,_ imageToGradient: UIImageView ,_ startColor: UIColor, _ endColor: UIColor,_ startAlpha: CGFloat,_ endAlpha: CGFloat,_ startPoint: CGPoint,_ endPoint: CGPoint) {
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = targetView.bounds
        gradientLayer.colors = [startColor.withAlphaComponent(startAlpha).cgColor, endColor.withAlphaComponent(endAlpha).cgColor, endColor.cgColor]
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        targetView.layer.addSublayer(gradientLayer)
        targetView.addSubview(imageToGradient)
        targetView.layer.mask = imageToGradient.layer
    }
}
