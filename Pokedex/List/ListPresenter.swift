//
//  ListPresenter.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation

class ListPresenter  {
    
    // MARK: Properties
    weak var view: ListViewProtocol?
    var interactor: ListInteractorInputProtocol?
    var wireFrame: ListWireFrameProtocol?
    
}

extension ListPresenter: ListPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension ListPresenter: ListInteractorOutputProtocol {
    
    // TODO: implement interactor output methods
}
