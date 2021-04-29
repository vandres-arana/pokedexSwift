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
    var generations: [GetGenerationsQuery.Data.Generation] = [];
    
    @IBOutlet weak var generationCollectionView: UICollectionView!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        generationCollectionView.dataSource = self;
    }
}

extension GenerationsView: GenerationsViewProtocol {
    // TODO: implement view output methods
    func presenterPushGenerationNames(receivedData: [GetGenerationsQuery.Data.Generation]) {
        self.generations = receivedData;
        DispatchQueue.main.async {
            self.generationCollectionView.reloadData()
        }
    }
}

extension GenerationsView : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return generations.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.IdentifierReusableCell.generationReusableCell, for: indexPath) as! GenerationCollectionViewCell;
        
        cell.generationLabel.text = generations[indexPath.row].name;
        
        return cell;
    }
}
