//
//  DetailPresenter.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation

class DetailPresenter {
    // MARK: Properties
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var wireFrame: DetailWireFrameProtocol?
}

extension DetailPresenter: DetailPresenterProtocol {
    // TODOs: implement presenter methods
    func viewDidLoad() {
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    // TODOs: implement interactor output methods
}
