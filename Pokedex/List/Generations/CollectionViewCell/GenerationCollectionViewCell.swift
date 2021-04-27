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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let view = UILabel()

        view.frame = CGRect(x: 0, y: 0, width: 110, height: 110)

        view.backgroundColor = .white


        let layer0 = CAGradientLayer()

        layer0.colors = [

          UIColor(red: 0.925, green: 0.925, blue: 0.925, alpha: 1).cgColor,

          UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1).cgColor

        ]

        layer0.locations = [0, 1]

        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)

        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)

        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1, b: 1, c: -1, d: 1, tx: 0.5, ty: -0.5))

        layer0.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)

        layer0.position = view.center

        view.layer.addSublayer(layer0)



        let parent = View!

        parent.addSubview(view)

        view.translatesAutoresizingMaskIntoConstraints = false

        view.widthAnchor.constraint(equalToConstant: 110).isActive = true

        view.heightAnchor.constraint(equalToConstant: 110).isActive = true

        view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 60).isActive = true

        view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 70).isActive = true
    }

}
