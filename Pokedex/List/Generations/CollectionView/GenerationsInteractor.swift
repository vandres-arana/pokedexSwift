//
//  GenerationsInteractor.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 28/4/21.
//  
//

import Foundation
import RealmSwift

class GenerationsInteractor: GenerationsInteractorInputProtocol {

    var generations = [Generation]()
    
    var realm = try! Realm()
    // MARK: Properties
    weak var presenter: GenerationsInteractorOutputProtocol?
    var localDatamanager: GenerationsLocalDataManagerInputProtocol?
    var remoteDatamanager: GenerationsRemoteDataManagerInputProtocol?
    
    func interactorRequestGenerationsNames() {
        remoteDatamanager?.externalRequestGenerationsNames()
    }
}

extension GenerationsInteractor: GenerationsRemoteDataManagerOutputProtocol {
    func getGenerationNames(receivedData: [GetGenerationsQuery.Data.Generation]) {
        for data in receivedData {
            let generation = Generation()
            generation.idGeneration = "\(data.id)"
            generation.name = data.name
            generations.append(generation)

//            try! realm.write({
//                realm.add(generation)
//            })
        }
        presenter?.interactorPushDataPresenter(generations: generations)
    }
}
