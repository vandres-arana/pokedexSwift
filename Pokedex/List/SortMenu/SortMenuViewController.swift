//
//  SortMenuViewController.swift
//  Pokedex
//
//  Created by user on 5/3/21.
//

import UIKit
import PullUpController

class SortMenuViewController: PullUpController {
    @IBOutlet var container: UIView!
    @IBOutlet var smallestNSort: UIButton!
    @IBOutlet var highestNSort: UIButton!
    @IBOutlet var azSort: UIButton!
    @IBOutlet var zaSort: UIButton!
    var presenter: SortMenuPresenterProtocol?
    var listView: ListView?
    var initSort:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initSelectedSort()
        container.layer.cornerRadius = 30
        smallestNSort.layer.cornerRadius = 10
        highestNSort.layer.cornerRadius = 10
        azSort.layer.cornerRadius = 10
        zaSort.layer.cornerRadius = 10
        initSort = listView?.getCurrentSortMethod()
    }
    @IBAction func changeSort(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        self.view = nil
        let selectedSort = (presenter?.sendSelectedSort(type: sender.tag))!
        listView?.dismissView(sortMenu: selectedSort)
    }

    func initSelectedSort() {
        switch listView?.getCurrentSortMethod() {
        case "dsc":
            selectedSort(buttonSort: highestNSort)
        case "az":
            selectedSort(buttonSort: azSort)
        case "za":
            selectedSort(buttonSort: zaSort)
        default:
            selectedSort(buttonSort: smallestNSort)
        }
    }
    func selectedSort(buttonSort:UIButton) {
        buttonSort.backgroundColor = UIColor(named: "selectedBackground")
        buttonSort.layer.shadowColor = UIColor(named: "selectedBackground")?.cgColor
        buttonSort.setTitleColor(UIColor(named: "selectedText"), for: .normal)
        buttonSort.layer.shadowOffset = CGSize(width: 0, height: 10)
        buttonSort.layer.shadowOpacity = 0.5
        buttonSort.layer.shadowRadius = 15.0
    }
    func setupElementBorderRadius() {
        self.view.layer.cornerRadius = 30
        smallestNSort.layer.cornerRadius = 10
        highestNSort.layer.cornerRadius = 10
        azSort.layer.cornerRadius = 10
        zaSort.layer.cornerRadius = 10
    }

    override var pullUpControllerMiddleStickyPoints: [CGFloat] {
        return [ 400,1000, 1150]
    }
    override func pullUpControllerDidDrag(to point: CGFloat) {
        if point == pullUpControllerMiddleStickyPoints[0] {
            self.dismiss(animated: false, completion: nil)
            self.view = nil
            listView?.dismissView(sortMenu: (initSort ?? "asc"))
        }
    }
}

extension SortMenuViewController: SortMenuViewProtocol {
}
//interactor presenter ....entity
