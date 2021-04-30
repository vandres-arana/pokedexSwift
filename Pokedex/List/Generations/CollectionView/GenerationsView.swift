//
//  GenerationsView.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 28/4/21.
//  
//

import Foundation
import UIKit

class GenerationsView: UIViewController {
    // MARK: Properties
    var presenter: GenerationsPresenterProtocol?
    var generations = [Generation]()
    @IBOutlet var generationCollectionView: UICollectionView!
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        generationCollectionView.dataSource = self
        generationCollectionView.delegate = self
        presenter?.viewDidLoad()
    }
}

extension GenerationsView: GenerationsViewProtocol {
    func presenterPushGenerationNames(generations: [Generation]) {
        self.generations = generations
        self.generationCollectionView.reloadData()
    }
}

extension GenerationsView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.generations.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.IdentifierReusableCell.generationReusableCell, for: indexPath) as? GenerationCollectionViewCell else {
            fatalError()
        }
        cell.setlabel(name: generations[indexPath.row].name)
        return cell
    }
}

extension GenerationsView : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.IdentifierReusableCell.generationReusableCell, for: indexPath) as? GenerationCollectionViewCell else {
            fatalError()
        }
        cell.backgroundColor = UIColor(named: "GenerationsBackgroundSelected")
    }
}
