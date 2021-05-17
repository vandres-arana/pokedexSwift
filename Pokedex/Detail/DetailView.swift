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
    var textViewExample: UITextView = UITextView()
    var pokemonTraining = [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemon.PokemonV2Pokemonstat]()
    @IBOutlet weak var viewForPokemonData: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var evYieldLabel: UILabel!
    @IBOutlet weak var catchRateLabel: UILabel!
    @IBOutlet weak var baseFriendshipLabel: UILabel!
    @IBOutlet weak var baseExpLabel: UILabel!
    @IBOutlet weak var growthRateLabel: UILabel!
    @IBOutlet weak var trainingLabel: UILabel!
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        label.text = presenter?.pokemon?.name
        trainingLabel.textColor = UIColor(named: (presenter?.pokemon?.getTypesList()[0])!)
        presenter?.fetchPokemonTraining()
        textViewExample = UITextView(frame: CGRect(x: 20.0, y: 90.0, width: 250.0, height: 100.0))
        textViewExample.contentInsetAdjustmentBehavior = .automatic
        textViewExample.center = viewForPokemonData.center
        textViewExample.backgroundColor = UIColor.lightGray
    }
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func showAbout(_ sender: UIButton) {
        viewForPokemonData.backgroundColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        textViewExample.text = "About"
        viewForPokemonData.addSubview(textViewExample)
    }
    @IBAction func showStats(_ sender: UIButton) {
        viewForPokemonData.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        textViewExample.text = "Stats"
        viewForPokemonData.addSubview(textViewExample)
    }
    @IBAction func showEvolution(_ sender: Any) {
        viewForPokemonData.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        textViewExample.text = "Evolution"
        viewForPokemonData.addSubview(textViewExample)
    }
}

extension DetailView: DetailViewProtocol {
    func showPokemonTraining(evYield: String, catchRate: String, baseFriendship: String, baseExperience: String, growthRate: String) {
        let temp = evYield.camelizedDash
        self.evYieldLabel.text = temp.camelized
        self.catchRateLabel.text = catchRate
        self.baseFriendshipLabel.text = baseFriendship
        self.baseExpLabel.text = baseExperience
        self.growthRateLabel.text = growthRate.camelizedDash
    }
    func showFailPokemonTraining() {
        let alert = UIAlertController(title: "Pokemon Training Error", message: "Could not fetch pokemon training", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "dismiss", style: .default, handler: nil)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
}
