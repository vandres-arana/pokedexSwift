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
    var generations: [GetGenerationsQuery.Data.Generation] = []
    @IBOutlet var generationCollectionView: UICollectionView!
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        generationCollectionView.dataSource = self
        presenter?.viewDidLoad()
//
//            PokeApiService.shared.apollo.fetch(query: GetGenerationsQuery()) { result in
//                switch result {
//                case .success(let getGenerationsQuery) :
//                    self.generations = getGenerationsQuery.data!.generations;
//                        self.generationCollectionView.reloadData()
//                    //print(self.generations)
//
//                    break;
//                case .failure(let error) :
//                    print(error);
//                    break;
//                }
//            }
    }
    @IBAction func pressButton(_ sender: Any) {
        self.generationCollectionView.reloadData()
    }
}

extension GenerationsView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return generations.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "generationCollectionViewCell", for: indexPath) as? GenerationCollectionViewCell else {
          fatalError()
        }
        cell.setlabel(name: generations[indexPath.row].name)
        return cell
    }
}

extension GenerationsView: GenerationsViewProtocol {
    func presenterPushGenerationNames(generations: [GetGenerationsQuery.Data.Generation]) {
        self.generations = generations
        self.generationCollectionView.reloadData()
        print(self.generations)
    }
}
