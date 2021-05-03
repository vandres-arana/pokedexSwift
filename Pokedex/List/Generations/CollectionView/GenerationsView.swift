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
    var generations = [GetGenerationsQuery.Data.Generation]()
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
    func presenterPushGenerationNames(generations: [GetGenerationsQuery.Data.Generation]) {
        self.generations = generations
        self.generationCollectionView.reloadData()
        
    }
}

extension GenerationsView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.generations.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.GenerationCell.reuseIdentifier, for: indexPath) as? GenerationCollectionViewCell else {
            fatalError()
        }
        cell.setlabel(name: generations[indexPath.row].name)
        
        let firstImage = cell.viewWithTag(1) as! UIImageView
        
        (cell.viewWithTag(1)as! UIImageView).image = self.imageByGenerationId(generationId: self.generations[indexPath.row].id, pokemonType: .GRASS)
        (cell.viewWithTag(2)as! UIImageView).image = self.imageByGenerationId(generationId: self.generations[indexPath.row].id, pokemonType: .FIRE)
        (cell.viewWithTag(3)as! UIImageView).image = self.imageByGenerationId(generationId: self.generations[indexPath.row].id, pokemonType: .WATER)
        return cell
    }
    func imageByGenerationId(generationId: Int, pokemonType: PokemonTypes) -> UIImage {
        switch generationId {
        case 1:
            switch pokemonType {
            case .FIRE: return #imageLiteral(resourceName: "004")
            case .GRASS: return #imageLiteral(resourceName: "001")
            case .WATER: return #imageLiteral(resourceName: "007")
            }
        case 2:
            switch pokemonType {
            case .FIRE: return #imageLiteral(resourceName: "155")
            case .GRASS: return #imageLiteral(resourceName: "152")
            case .WATER: return #imageLiteral(resourceName: "158")
            }
        case 3:
            switch pokemonType {
            case .FIRE: return #imageLiteral(resourceName: "255")
            case .GRASS: return #imageLiteral(resourceName: "252")
            case .WATER: return #imageLiteral(resourceName: "258")
            }
        case 4:
            switch pokemonType {
            case .FIRE: return #imageLiteral(resourceName: "390")
            case .GRASS: return #imageLiteral(resourceName: "387")
            case .WATER: return #imageLiteral(resourceName: "393")
            }
        case 5:
            switch pokemonType {
            case .FIRE: return #imageLiteral(resourceName: "498")
            case .GRASS: return #imageLiteral(resourceName: "495")
            case .WATER: return #imageLiteral(resourceName: "501")
            }
        case 6:
            switch pokemonType {
            case .FIRE: return #imageLiteral(resourceName: "653")
            case .GRASS: return #imageLiteral(resourceName: "650")
            case .WATER: return #imageLiteral(resourceName: "656")
            }
        case 7:
            switch pokemonType {
            case .FIRE: return  #imageLiteral(resourceName: "725")
            case .GRASS: return #imageLiteral(resourceName: "722")
            case .WATER: return #imageLiteral(resourceName: "728")
            }
        case 8:
            switch pokemonType {
            case .FIRE: return #imageLiteral(resourceName: "813")
            case .GRASS: return #imageLiteral(resourceName: "810")
            case .WATER: return #imageLiteral(resourceName: "816")
            }
        default:
            return #imageLiteral(resourceName: "007")
        }
    }
}

extension GenerationsView : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.GenerationCell.reuseIdentifier, for: indexPath) as? GenerationCollectionViewCell else {
            fatalError()
        }
        cell.backgroundColor = UIColor(named: "GenerationsBackgroundSelected")
        
        collectionView.reloadData()
    }
}
