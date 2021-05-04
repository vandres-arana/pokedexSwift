//
//  GenerationsView.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 28/4/21.
//  
//

import Foundation
import UIKit
import PullUpController

class GenerationsView: UIViewController {
    // MARK: Properties
    @IBOutlet weak var scrollItem: UIButton!
    @IBOutlet weak var generationView: UIView!
    @IBOutlet var generationCollectionView: UICollectionView!
    
    var presenter: GenerationsPresenterProtocol?
    var generations = [GetGenerationsQuery.Data.Generation]()
    var generationSelected : GetGenerationsQuery.Data.Generation?
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCornerRadius()
        self.setupCollectionView()
        presenter?.viewDidLoad()
    }

    func setupCollectionView() {
        generationCollectionView.dataSource = self
        generationCollectionView.delegate = self
        generationCollectionView.register(UINib.init(nibName: Constants.GenerationCell.nibName, bundle: nil), forCellWithReuseIdentifier: Constants.GenerationCell.reuseIdentifier)
    }

    func setupCornerRadius() {
        self.view.layer.cornerRadius = 30
        self.scrollItem.layer.cornerRadius = 2.5
        self.generationView.layer.cornerRadius = 30
    }

    // MARK: PullUpController methods
    //    override var pullUpControllerMiddleStickyPoints: [CGFloat] {
    //        return [600, 1000, 1400]
    //    }
    //
    //    override func pullUpControllerDidDrag(to point: CGFloat) {
    //        if point == pullUpControllerMiddleStickyPoints[0] {
    //            self.dismiss(animated: false, completion: nil)
    //            self.view = nil
    //        }
    //    }
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
        let generation: GetGenerationsQuery.Data.Generation = self.generations[indexPath.row]
        let firstImage = self.imageByGenerationId(generationId: generation.id, pokemonType: .GRASS)
        let secondImage = self.imageByGenerationId(generationId: generation.id, pokemonType: .FIRE)
        let thirdImage = self.imageByGenerationId(generationId: generation.id, pokemonType: .WATER)

        cell.setImages(firstImage: firstImage, secondImage: secondImage, thirdImage: thirdImage)
        cell.setlabel(name: generation.name)
        cell.setSelectedCell(isSelected: generation.id == generationSelected?.id)
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
        generationSelected = generations[indexPath.row]
        collectionView.reloadData()
    }
}
