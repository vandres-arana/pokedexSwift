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
    var test = ""
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
        print(generations.count)
        print(test)
    }
}

extension GenerationsView: GenerationsViewProtocol {
    func presenterPushGenerationNames(generations: [Generation]) {
        self.generations = generations
        DispatchQueue.main.async {
            self.generationCollectionView.reloadData()
        }
        self.test = "hola"
        print(generations)
        print(test)
    }
}

extension GenerationsView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.generations.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "generationCollectionViewCell", for: indexPath) as? GenerationCollectionViewCell else {
            fatalError()
        }
        cell.setlabel(name: generations[indexPath.row].name)
        return cell
    }
}
