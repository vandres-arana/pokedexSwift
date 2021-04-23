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
}

extension ListView: ListViewProtocol {
    // TODO: implement view output methods
}
