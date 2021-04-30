//
//  FiltersMenuView.swift
//  Pokedex
//
//  Created by Victor Arana on 4/29/21.
//  
//

import Foundation
import UIKit
import PullUpController

protocol FilterProtocol {
    func dismissView()
}

class FiltersMenuView: PullUpController {

    // MARK: Properties
    var presenter: FiltersMenuPresenterProtocol?
    @IBOutlet var scrollItem: UIButton!
    @IBOutlet var filterView: UIView!
    @IBOutlet var typeCollection: UICollectionView!
    @IBOutlet var weaknessCollection: UICollectionView!
    @IBOutlet var heightFilterCollection: UICollectionView!
    @IBOutlet var weightFilterCollection: UICollectionView!
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var applyButton: UIButton!
    var listView: ListView?
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.cornerRadius = 30
        self.filterView.layer.cornerRadius = 30
        resetButton.layer.cornerRadius = 10
        applyButton.layer.cornerRadius = 10
        scrollItem.layer.cornerRadius = 2.5
        typeCollection.dataSource = self
        weaknessCollection.dataSource = self
        heightFilterCollection.dataSource = self
        weightFilterCollection.dataSource = self
        typeCollection.delegate = self
        weaknessCollection.delegate = self
        heightFilterCollection.delegate = self
        weightFilterCollection.delegate = self
        typeCollection.showsHorizontalScrollIndicator = false
        weaknessCollection.showsHorizontalScrollIndicator = false
        heightFilterCollection.showsHorizontalScrollIndicator = false
        weightFilterCollection.showsHorizontalScrollIndicator = false
        typeCollection.allowsMultipleSelection = true
        weaknessCollection.allowsMultipleSelection = true
        heightFilterCollection.allowsMultipleSelection = true
        weightFilterCollection.allowsMultipleSelection = true
        self.registerNib()
    }
    
    func registerNib() {
        let nib = UINib(nibName: FiltersMenuTypeCell.nibName, bundle: nil)
        typeCollection?.register(nib, forCellWithReuseIdentifier: FiltersMenuTypeCell.reuseIdentifier)
        weaknessCollection?.register(nib, forCellWithReuseIdentifier: FiltersMenuTypeCell.reuseIdentifier)
        heightFilterCollection?.register(nib, forCellWithReuseIdentifier: FiltersMenuTypeCell.reuseIdentifier)
        weightFilterCollection?.register(nib, forCellWithReuseIdentifier: FiltersMenuTypeCell.reuseIdentifier)
        if let flowLayout = self.typeCollection?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        if let flowLayout = self.weaknessCollection?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        if let flowLayout = self.heightFilterCollection?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        if let flowLayout = self.weightFilterCollection?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }
    
    override var pullUpControllerMiddleStickyPoints: [CGFloat] {
        return [400, 800, 1000, 1200]
    }
    
    override func pullUpControllerDidDrag(to point: CGFloat) {
        if point == pullUpControllerMiddleStickyPoints[0] {
            self.dismiss(animated: false, completion: nil)
            self.view = nil
            listView?.dismissView()
        }
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        presenter?.resetFilters()
        typeCollection.reloadData()
        weaknessCollection.reloadData()
        heightFilterCollection.reloadData()
        weightFilterCollection.reloadData()
    }
    
    @IBAction func applyButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
        self.view = nil
        listView?.dismissView()
    }
    
}

extension FiltersMenuView:  UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.typeCollection {
            return presenter?.getPokemonFilterListLength(filterId: 0) ?? 0
        } else if collectionView == self.weaknessCollection {
            return presenter?.getPokemonFilterListLength(filterId: 1) ?? 0
        } else if collectionView == self.heightFilterCollection {
            return presenter?.getPokemonFilterListLength(filterId: 2) ?? 0
        } else {
            return presenter?.getPokemonFilterListLength(filterId: 3) ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FiltersMenuTypeCell.reuseIdentifier, for: indexPath) as? FiltersMenuTypeCell {
            var type: Filter
            if collectionView == self.typeCollection {
                type = (presenter?.getPokemonFilterByIndex(index: indexPath.row, filterId: 0))!
            } else if collectionView == self.weaknessCollection {
                type = (presenter?.getPokemonFilterByIndex(index: indexPath.row, filterId: 1))!
            } else if collectionView == self.heightFilterCollection {
                type = (presenter?.getPokemonFilterByIndex(index: indexPath.row, filterId: 2))!
            } else {
                type = (presenter?.getPokemonFilterByIndex(index: indexPath.row, filterId: 3))!
            }
            cell.configure(type.name)
            if type.isSelected {
                cell.isSelected = type.isSelected
            }
            return cell
        }
        return UICollectionViewCell()
    }
}

extension FiltersMenuView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 55, height: 60)
    }
}

extension FiltersMenuView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        var type: Filter
        if collectionView == self.typeCollection {
            type = (presenter?.getPokemonFilterByIndex(index: indexPath.row, filterId: 0))!
            presenter?.markPokemonFilterByIndex(index: indexPath.row, filterId: 0)
        } else if collectionView == self.weaknessCollection {
            type = (presenter?.getPokemonFilterByIndex(index: indexPath.row, filterId: 1))!
            presenter?.markPokemonFilterByIndex(index: indexPath.row, filterId: 1)
        } else if collectionView == self.heightFilterCollection {
            type = (presenter?.getPokemonFilterByIndex(index: indexPath.row, filterId: 2))!
            presenter?.markPokemonFilterByIndex(index: indexPath.row, filterId: 2)
        } else {
            type = (presenter?.getPokemonFilterByIndex(index: indexPath.row, filterId: 3))!
            presenter?.markPokemonFilterByIndex(index: indexPath.row, filterId: 3)
        }
        cell?.isSelected = type.isSelected
    }
}

extension FiltersMenuView: FiltersMenuViewProtocol {
    // TODO: implement view output methods
}
