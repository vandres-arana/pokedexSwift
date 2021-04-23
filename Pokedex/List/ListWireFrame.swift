//
//  ListWireFrame.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation
import UIKit

class ListWireFrame: ListWireFrameProtocol {

    class func createListModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "ListView")
        if let view = navController.children.first as? ListView {
            let presenter: ListPresenterProtocol & ListInteractorOutputProtocol = ListPresenter()
            let interactor: ListInteractorInputProtocol & ListRemoteDataManagerOutputProtocol = ListInteractor()
            let localDataManager: ListLocalDataManagerInputProtocol = ListLocalDataManager()
            let remoteDataManager: ListRemoteDataManagerInputProtocol = ListRemoteDataManager()
            let wireFrame: ListWireFrameProtocol = ListWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "ListView", bundle: Bundle.main)
    }
    
}
