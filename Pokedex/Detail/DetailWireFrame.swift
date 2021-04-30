//
//  DetailWireFrame.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation
import UIKit

class DetailWireFrame: DetailWireFrameProtocol {

    class func createDetailModule() -> UIViewController {
        let navController = detailStoryboard.instantiateViewController(withIdentifier: Constants.StoryBoard.detailViewStoryBoardID)
        if let view = navController.children.first as? DetailView {
            let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
            let interactor: DetailInteractorInputProtocol & DetailRemoteDataManagerOutputProtocol = DetailInteractor()
            let localDataManager: DetailLocalDataManagerInputProtocol = DetailLocalDataManager()
            let remoteDataManager: DetailRemoteDataManagerInputProtocol = DetailRemoteDataManager()
            let wireFrame: DetailWireFrameProtocol = DetailWireFrame()
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
    static var detailStoryboard: UIStoryboard {
        return UIStoryboard(name: Constants.StoryBoard.detailViewStoryBoardID, bundle: Bundle.main)
    }
}
