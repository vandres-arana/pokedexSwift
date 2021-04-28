//
//  GenerationsPresenter.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 28/4/21.
//  
//

import Foundation

class GenerationsPresenter  {
    
    // MARK: Properties
    weak var view: GenerationsViewProtocol?
    var interactor: GenerationsInteractorInputProtocol?
    var wireFrame: GenerationsWireFrameProtocol?
    
}

extension GenerationsPresenter: GenerationsPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension GenerationsPresenter: GenerationsInteractorOutputProtocol {
    // TODO: implement interactor output methods
    
    func getGenerationNames(generations: [GetGenerationsQuery.Data.Generation]) {
         
    }
}
