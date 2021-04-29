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
    
    let types = [PokemonType("bug"), PokemonType("dark"), PokemonType("dragon"), PokemonType("electric"), PokemonType("fairy"), PokemonType("fighting"),
                 PokemonType("fire"), PokemonType("flying"), PokemonType("ghost"), PokemonType("grass"), PokemonType("ground"), PokemonType("ice"),
                 PokemonType("normal"), PokemonType("poison"), PokemonType("psychic"), PokemonType("rock"), PokemonType("steel"), PokemonType("water")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView1.dataSource = self
        collectionView1.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView1.showsHorizontalScrollIndicator = false
        collectionView.allowsMultipleSelection = true
        collectionView1.allowsMultipleSelection = true
        self.registerNib()
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
                cell.configure(types[indexPath.row].name)
                cell.isSelected = types[indexPath.row].isSelected
                return cell
            }
            return UICollectionViewCell()
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterMenuTypeCell.reuseIdentifier, for: indexPath) as? FilterMenuTypeCell {
                cell.configure(types[indexPath.row].name)
                cell.isSelected = types[indexPath.row].isSelected
                return cell
            }
            return UICollectionViewCell()
        }
        
    }
}

extension FilterMenu: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 55, height: 60)
    }
}

extension FilterMenu: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionView {
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.isSelected = !types[indexPath.row].isSelected
        } else {
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.isSelected = !types[indexPath.row].isSelected
        }
        types[indexPath.row].isSelected = !types[indexPath.row].isSelected
    }
}
