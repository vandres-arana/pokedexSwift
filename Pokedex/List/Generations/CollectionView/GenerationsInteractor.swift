//
//  GenerationsInteractor.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 28/4/21.
//  
//

import Foundation

class GenerationsInteractor: GenerationsInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: GenerationsInteractorOutputProtocol?
    var localDatamanager: GenerationsLocalDataManagerInputProtocol?
    var remoteDatamanager: GenerationsRemoteDataManagerInputProtocol?
    
    func getGenerations(){
        remoteDatamanager?.externalGetGenerations();
    }
}

extension GenerationsInteractor: GenerationsRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    
    func getGenerationNames(generations: [GetGenerationsQuery.Data.Generation]) {
        presenter?.interactorPushDataPresenter(receivedData: generations);
    }
}
