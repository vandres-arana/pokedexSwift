//
//  FiltersMenuWireFrame.swift
//  Pokedex
//
//  Created by Victor Arana on 4/29/21.
//  
//

import Foundation
import UIKit

class FiltersMenuWireFrame: FiltersMenuWireFrameProtocol {

    class func createFiltersMenuModule() -> UIViewController {
        //let navController = mainStoryboard.instantiateViewController(withIdentifier: "FiltersMenuView")
        //if let view = navController.children.first as? FiltersMenuView {
        let view = mainStoryboard.instantiateViewController(withIdentifier: "FiltersMenuView") as! FiltersMenuView
            let presenter: FiltersMenuPresenterProtocol & FiltersMenuInteractorOutputProtocol = FiltersMenuPresenter()
            let localDataManager: FiltersMenuLocalDataManagerInputProtocol = FiltersMenuLocalDataManager()
            let interactor: FiltersMenuInteractorInputProtocol & FiltersMenuRemoteDataManagerOutputProtocol = FiltersMenuInteractor()
            let remoteDataManager: FiltersMenuRemoteDataManagerInputProtocol = FiltersMenuRemoteDataManager()
            let wireFrame: FiltersMenuWireFrameProtocol = FiltersMenuWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            interactor.loadPokemonTypeList()
            
            //return navController
            return view
        //}
        //return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "FiltersMenuView", bundle: Bundle.main)
    }
    
}
