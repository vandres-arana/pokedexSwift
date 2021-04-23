//
//  ListInteractor.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation

class ListInteractor: ListInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: ListInteractorOutputProtocol?
    var localDatamanager: ListLocalDataManagerInputProtocol?
    var remoteDatamanager: ListRemoteDataManagerInputProtocol?

}

extension ListInteractor: ListRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
