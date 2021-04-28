//
//  FilterMenu.swift
//  Pokedex
//
//  Created by Victor Arana on 4/27/21.
//

import UIKit

class FilterMenu: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var collectionView1: UICollectionView!
    
    let types = ["bug", "dark", "dragon", "electric", "fairy", "fighting", "fire", "flying", "ghost", "grass", "ground", "ice", "normal", "poison", "psychic", "rock", "steel", "water"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView1.dataSource = self
        collectionView1.delegate = self
        self.registerNib()
        collectionView.showsHorizontalScrollIndicator = false
        collectionView1.showsHorizontalScrollIndicator = false
    }
    
    func registerNib() {
        let nib = UINib(nibName: FilterMenuTypeCell.nibName, bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: FilterMenuTypeCell.reuseIdentifier)
        collectionView1?.register(nib, forCellWithReuseIdentifier: FilterMenuTypeCell.reuseIdentifier)
        if let flowLayout = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        if let flowLayout = self.collectionView1?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }

}

extension FilterMenu:  UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return types.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterMenuTypeCell.reuseIdentifier, for: indexPath) as? FilterMenuTypeCell {
                cell.configure(imageName: types[indexPath.row])
                return cell
            }
            return UICollectionViewCell()
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterMenuTypeCell.reuseIdentifier, for: indexPath) as? FilterMenuTypeCell {
                cell.configure(imageName: types[indexPath.row])
                return cell
            }
            return UICollectionViewCell()
        }
        
    }
}

extension FilterMenu: UICollectionViewDelegate {
    
}
