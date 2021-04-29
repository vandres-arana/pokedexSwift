//
//  FiltersMenuView.swift
//  Pokedex
//
//  Created by Victor Arana on 4/29/21.
//  
//

import Foundation
import UIKit

class FiltersMenuView: UIViewController {

    // MARK: Properties
    var presenter: FiltersMenuPresenterProtocol?
    @IBOutlet var typeCollection: UICollectionView!
    @IBOutlet var weaknessCollection: UICollectionView!
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        typeCollection.dataSource = self
        weaknessCollection.dataSource = self
        typeCollection.delegate = self
        weaknessCollection.delegate = self
        typeCollection.showsHorizontalScrollIndicator = false
        weaknessCollection.showsHorizontalScrollIndicator = false
        typeCollection.allowsMultipleSelection = true
        weaknessCollection.allowsMultipleSelection = true
        self.registerNib()
    }
    
    func registerNib() {
        let nib = UINib(nibName: FiltersMenuTypeCell.nibName, bundle: nil)
        typeCollection?.register(nib, forCellWithReuseIdentifier: FiltersMenuTypeCell.reuseIdentifier)
        weaknessCollection?.register(nib, forCellWithReuseIdentifier: FiltersMenuTypeCell.reuseIdentifier)
        if let flowLayout = self.typeCollection?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        if let flowLayout = self.weaknessCollection?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }
}

extension FiltersMenuView:  UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getPokemonTypeListLength() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FiltersMenuTypeCell.reuseIdentifier, for: indexPath) as? FiltersMenuTypeCell {
            var type: PokemonType
            if collectionView == self.typeCollection {
                type = (presenter?.getPokemonTypeByIndex(index: indexPath.row, collection: 0))!
                
            } else {
                type = (presenter?.getPokemonTypeByIndex(index: indexPath.row, collection: 1))!
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
        var type: PokemonType
        if collectionView == self.typeCollection {
            type = (presenter?.getPokemonTypeByIndex(index: indexPath.row, collection: 0))!
            presenter?.markPokemonTypeByIndex(index: indexPath.row, collection: 0)
        } else {
            type = (presenter?.getPokemonTypeByIndex(index: indexPath.row, collection: 1))!
            presenter?.markPokemonTypeByIndex(index: indexPath.row, collection: 1)
        }
        cell?.isSelected = type.isSelected
    }
}

extension FiltersMenuView: FiltersMenuViewProtocol {
    // TODO: implement view output methods
}
