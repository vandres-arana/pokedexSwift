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
        let firstImage = cell.viewWithTag(1) as! UIImageView
        switch generations[indexPath.row].idGeneration {
        case "1":firstImage.image = #imageLiteral(resourceName: "001")
        case "2":firstImage.image = #imageLiteral(resourceName: "152")
        case "3":firstImage.image = #imageLiteral(resourceName: "252")
        case "4":firstImage.image = #imageLiteral(resourceName: "387")
        case "5":firstImage.image = #imageLiteral(resourceName: "495")
        case "6":firstImage.image = #imageLiteral(resourceName: "650")
        case "7":firstImage.image = #imageLiteral(resourceName: "722")
        case "8":firstImage.image = #imageLiteral(resourceName: "810")
        case .none: break
        case .some(_): break
        }
        let secondImage = cell.viewWithTag(2)as! UIImageView
        switch generations[indexPath.row].idGeneration {
        case "1":secondImage.image = #imageLiteral(resourceName: "004")
        case "2":secondImage.image = #imageLiteral(resourceName: "155")
        case "3":secondImage.image = #imageLiteral(resourceName: "255")
        case "4":secondImage.image = #imageLiteral(resourceName: "390")
        case "5":secondImage.image = #imageLiteral(resourceName: "498")
        case "6":secondImage.image = #imageLiteral(resourceName: "653")
        case "7":secondImage.image = #imageLiteral(resourceName: "725")
        case "8":secondImage.image = #imageLiteral(resourceName: "813")
        case .none: break
        case .some(_): break
        }
        let thirdImage = cell.viewWithTag(3)as! UIImageView
        switch generations[indexPath.row].idGeneration {
        case "1":thirdImage.image = #imageLiteral(resourceName: "007")
        case "2":thirdImage.image = #imageLiteral(resourceName: "158")
        case "3":thirdImage.image = #imageLiteral(resourceName: "258")
        case "4":thirdImage.image = #imageLiteral(resourceName: "393")
        case "5":thirdImage.image = #imageLiteral(resourceName: "501")
        case "6":thirdImage.image = #imageLiteral(resourceName: "656")
        case "7":thirdImage.image = #imageLiteral(resourceName: "728")
        case "8":thirdImage.image = #imageLiteral(resourceName: "816")
        case .none: break
        case .some(_): break
        }
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
