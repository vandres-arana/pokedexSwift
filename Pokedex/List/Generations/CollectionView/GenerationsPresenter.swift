//
//  GenerationsPresenter.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 28/4/21.
//  
//

import Foundation

class GenerationsPresenter {
    // MARK: Properties
    weak var view: GenerationsViewProtocol?
    var interactor: GenerationsInteractorInputProtocol?
    var wireFrame: GenerationsWireFrameProtocol?
}

extension GenerationsPresenter: GenerationsPresenterProtocol {
    func viewDidLoad() {
        interactor?.interactorRequestGenerationsNames()
    }
}

extension GenerationsPresenter: GenerationsInteractorOutputProtocol {
    func interactorPushDataPresenter(generations: [Generation]) {
        view?.presenterPushGenerationNames(generations: generations)
    }
}
