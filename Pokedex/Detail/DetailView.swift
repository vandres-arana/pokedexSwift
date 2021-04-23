//
//  DetailView.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation
import UIKit

class DetailView: UIViewController {

    // MARK: Properties
    var presenter: DetailPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension DetailView: DetailViewProtocol {
    // TODO: implement view output methods
}
