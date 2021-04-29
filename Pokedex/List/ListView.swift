//
//  ListView.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation
import UIKit

class ListView: UIViewController {

    // MARK: Properties
    var presenter: ListPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onButtonTapped(_ sender: UIButton) {
        let viewC = FiltersMenuWireFrame.createFiltersMenuModule()
        present(viewC, animated: true, completion: nil)
    }
    
}

extension ListView: ListViewProtocol {
    // TODO: implement view output methods
}
