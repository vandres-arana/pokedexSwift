//
//  SortMenuPresenter.swift
//  Pokedex
//
//  Created by user on 5/3/21.
//

import Foundation

class SortMenuPresenter {
    weak var view: SortMenuViewProtocol?
    var interactor: SortMenuInteractorInputProtocol?
    var wireFrame: SortMenuWireFrameProtocol?
}

extension SortMenuPresenter: SortMenuPresenterProtocol {
    func sendSelectedSort(type: Int) -> String {
        switch type {
        case 1:
            return "asc"
        case 2:
            return "dsc"
        case 3:
            return "az"
        case 4:
            return "za"
        default:
            return "asc"
        }
    }
    func viewDidLoad() {
    }
    func applySort(sort: String) -> String {
        return sort
    }
}

extension SortMenuPresenter: SortMenuInteractorOutputProtocol {
}
