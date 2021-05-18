//
//  DetailView.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation
import UIKit

class DetailView: UIViewController {
    // MARK: Properties
    var presenter: DetailPresenterProtocol?
    var pokemonTraining = [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemon.PokemonV2Pokemonstat]()
    @IBOutlet weak var viewForPokemonData: UIView!
    @IBOutlet weak var pokeballAbout: UIImageView!
    @IBOutlet weak var pokeballStats: UIImageView!
    @IBOutlet weak var pokeballEvolution: UIImageView!
    @IBOutlet weak var viewPokeballAbout: UIView!
    @IBOutlet weak var viewPokeballStats: UIView!
    @IBOutlet weak var viewPokeballEvolution: UIView!
    @IBOutlet weak var buttonAbout: UIButton!
    @IBOutlet weak var buttonStats: UIButton!
    @IBOutlet weak var buttonEvolution: UIButton!
    @IBOutlet weak var viewEvolution: EvolutionView!
    @IBOutlet weak var viewStats: StatsView!
    @IBOutlet weak var viewAbout: AboutView!
    @IBOutlet weak var contentView: UIView!
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        presenter?.fetchPokemonTraining()
        resetButtons()
    }
    func resetButtons() {
        self.buttonAbout.alpha = 0.5
        self.buttonStats.alpha = 0.5
        self.buttonEvolution.alpha = 0.5
        Helpers.createGradientImage(self.viewPokeballAbout, pokeballAbout, #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), CGFloat(0.0), CGFloat(0.3), CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 0))
        Helpers.createGradientImage(self.viewPokeballStats, pokeballStats, #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), CGFloat(0.0), CGFloat(0.3), CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 0))
        Helpers.createGradientImage(self.viewPokeballEvolution, pokeballEvolution, #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), CGFloat(0.0), CGFloat(0.3), CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 0))
        self.viewAbout.isHidden = true
        self.viewStats.isHidden = true
        self.viewEvolution.isHidden = true
        self.pokeballAbout.isHidden = true
        self.pokeballStats.isHidden = true
        self.pokeballEvolution.isHidden = true
    }
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func showAbout(_ sender: UIButton) {
        self.resetButtons()
        self.buttonAbout.alpha = 1.0
        self.pokeballAbout.isHidden = false
        self.viewAbout.isHidden = false
    }
    @IBAction func showStats(_ sender: UIButton) {
        self.resetButtons()
        self.buttonStats.alpha = 1.0
        self.pokeballStats.isHidden = false
        self.viewStats.isHidden = false
    }
    @IBAction func showEvolution(_ sender: UIButton) {
        self.resetButtons()
        self.buttonEvolution.alpha = 1.0
        self.pokeballEvolution.isHidden = false
        self.viewEvolution  .isHidden = false
    }
}

extension DetailView: DetailViewProtocol {
    func showPokemonTraining(evYield: String, catchRate: String, baseFriendship: String, baseExperience: String, growthRate: String) {
    }
    func showFailPokemonTraining() {
    }
}
