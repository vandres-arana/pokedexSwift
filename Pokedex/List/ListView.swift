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

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ListView: ListViewProtocol {
    func dismissView(sortMenu:String) {
        print(sortMenu)
        self.view.backgroundColor = UIColor.white
    }
    func getCurrentSortMethod() -> String {
        return "asc"
    }
}
