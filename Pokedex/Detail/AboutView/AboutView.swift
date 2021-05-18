//
//  About.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 17/5/21.
//

import UIKit

class AboutView: UIView {
    @IBOutlet var contentView: UIView!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    func initSubviews() {
        Bundle.main.loadNibNamed("AboutView", owner: self, options: nil)
        guard let content = contentView else { return }
        content.frame = self.bounds
        content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(content)
    }
}
