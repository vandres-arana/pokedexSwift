//
//  ListView.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation
import UIKit
import PullUpController

class ListView: UIViewController {

    // MARK: Properties
    var presenter: ListPresenterProtocol?
    @IBOutlet var filterButton: UIButton!
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onButtonTapped(_ sender: UIButton) {
        print("Button Pressed")
        let viewC = FiltersMenuWireFrame.createFiltersMenuModule() as! FiltersMenuView
        viewC.listView = self
        addPullUpController(viewC, initialStickyPointOffset: CGFloat(800), animated: true)
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.7)
    }
    
}

extension ListView: ListViewProtocol {
    // TODO: implement view output methods
}

extension ListView: FilterProtocol {
    func dismissView() {
        self.filterButton.isUserInteractionEnabled = true
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
}
