//
//  GenerationsView.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 28/4/21.
//  
//

import Foundation
import UIKit

class GenerationsView: UIViewController {

    // MARK: Properties
    var presenter: GenerationsPresenterProtocol?
    var generations: [GetGenerationsQuery.Data.Generation] = [];

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension GenerationsView: GenerationsViewProtocol {
    // TODO: implement view output methods
    func presenterPushGenerationNames(receivedData: [GetGenerationsQuery.Data.Generation]) {
        self.generations = receivedData;
    }
}
