//
//  Helpers.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 5/5/21.
//

import Foundation
import UIKit

class Helpers {
    
   static func createGradientImage(_ targetView: UIView,_ imageToGradient: UIImageView ,_ startColor: UIColor, _ endColor: UIColor,_ startAlpha: CGFloat,_ endAlpha: CGFloat,_ startPoint: CGPoint,_ endPoint: CGPoint) {
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
