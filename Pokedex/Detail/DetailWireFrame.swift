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
    class func createDetailModule(detailview: DetailView, data: GetAllPokemonsWithLimitQuery.Data.Pokemon) {
        let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
        let interactor: DetailInteractorInputProtocol & DetailRemoteDataManagerOutputProtocol = DetailInteractor()
        let localDataManager: DetailLocalDataManagerInputProtocol = DetailLocalDataManager()
        let remoteDataManager: DetailRemoteDataManagerInputProtocol = DetailRemoteDataManager()
        let wireFrame: DetailWireFrameProtocol = DetailWireFrame()
        detailview.presenter = presenter
        presenter.view = detailview
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        presenter.pokemon = data
        interactor.presenter = presenter
        interactor.localDatamanager = localDataManager
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
    }
    static var detailStoryboard: UIStoryboard {
        return UIStoryboard(name: Constants.StoryBoard.detailViewStoryBoardID, bundle: Bundle.main)
    }
}
