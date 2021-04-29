//
//  GenerationsProtocols.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 28/4/21.
//  
//

import Foundation
import UIKit

protocol GenerationsViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: GenerationsPresenterProtocol? { get set }
    func presenterPushGenerationNames(receivedData: [GetGenerationsQuery.Data.Generation])
}

protocol GenerationsWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createGenerationsModule() -> UIViewController
}

protocol GenerationsPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: GenerationsViewProtocol? { get set }
    var interactor: GenerationsInteractorInputProtocol? { get set }
    var wireFrame: GenerationsWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol GenerationsInteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func interactorPushDataPresenter(receivedData: [GetGenerationsQuery.Data.Generation]);
}

protocol GenerationsInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: GenerationsInteractorOutputProtocol? { get set }
    var localDatamanager: GenerationsLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: GenerationsRemoteDataManagerInputProtocol? { get set }
    
    func getGenerations();
}

protocol GenerationsDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol GenerationsRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: GenerationsRemoteDataManagerOutputProtocol? { get set }
    func getGenerations();
}

protocol GenerationsRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    
    func getGenerationNames(generations: [GetGenerationsQuery.Data.Generation]);
}

protocol GenerationsLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
