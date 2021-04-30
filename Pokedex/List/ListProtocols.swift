//
//  ListProtocols.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation
import UIKit

protocol ListViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: ListPresenterProtocol? { get set }
}

protocol ListWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createListModule() -> UIViewController
}

protocol ListPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: ListViewProtocol? { get set }
    var interactor: ListInteractorInputProtocol? { get set }
    var wireFrame: ListWireFrameProtocol? { get set }
    func viewDidLoad()
}

protocol ListInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol ListInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: ListInteractorOutputProtocol? { get set }
    var localDatamanager: ListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ListRemoteDataManagerInputProtocol? { get set }
}

protocol ListDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol ListRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ListRemoteDataManagerOutputProtocol? { get set }
}

protocol ListRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol ListLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
