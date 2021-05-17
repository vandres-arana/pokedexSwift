//
//  Evolution.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 17/5/21.
//

import UIKit

class Evolution: UIView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
     
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var exampleLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    func initSubviews() {
        Bundle.main.loadNibNamed("Evolution", owner: self, options: nil)
        guard let content = contentView else { return }
        content.frame = self.bounds
        content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(content)
    }
    
    func exampleMethod(test: String) {
        self.exampleLabel.text = test
    }
}
