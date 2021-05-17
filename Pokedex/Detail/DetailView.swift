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
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var evYieldLabel: UILabel!
    @IBOutlet weak var catchRateLabel: UILabel!
    @IBOutlet weak var baseFriendshipLabel: UILabel!
    @IBOutlet weak var baseExpLabel: UILabel!
    @IBOutlet weak var growthRateLabel: UILabel!
    @IBOutlet weak var trainingLabel: UILabel!
    @IBOutlet weak var pokeballAbout: UIImageView!
    @IBOutlet weak var pokeballStats: UIImageView!
    @IBOutlet weak var pokeballEvolution: UIImageView!
    @IBOutlet weak var viewPokeballAbout: UIView!
    @IBOutlet weak var viewPokeballStats: UIView!
    @IBOutlet weak var viewPokeballEvolution: UIView!
    @IBOutlet weak var buttonAbout: UIButton!
    @IBOutlet weak var buttonStats: UIButton!
    @IBOutlet weak var buttonEvolution: UIButton!
    //@IBOutlet weak var viewEvolution: UIView!
    @IBOutlet weak var viewEvolution: Evolution!
    
    @IBOutlet weak var viewStats: UIView!
    @IBOutlet weak var viewAbout: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    // MARK: Lifecycle
    //var myCustomView = About()
//    @IBAction func boton1clic(_ sender: Any) {
//        view1.isHidden = false
//        view2.isHidden = true
//    }
//    @IBAction func boton2clic(_ sender: Any) {
//        view1.isHidden = true
//        view2.isHidden = false
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
//        view1.isHidden = true
//        view2.isHidden = true
        viewEvolution.exampleMethod(test: "Hola mundo")
//        label.text = presenter?.pokemon?.name
//        //trainingLabel.textColor = UIColor(named: (presenter?.pokemon?.getTypesList()[0])!)
//        presenter?.fetchPokemonTraining()
//        Helpers.createGradientImage(self.viewPokeballAbout, pokeballAbout, #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), CGFloat(0.0), CGFloat(0.3), CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 0))
//        Helpers.createGradientImage(self.viewPokeballStats, pokeballStats, #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), CGFloat(0.0), CGFloat(0.3), CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 0))
//        Helpers.createGradientImage(self.viewPokeballEvolution, pokeballEvolution, #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), CGFloat(0.0), CGFloat(0.3), CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 0))
//        buttonAbout.alpha = 0.5
//        buttonStats.alpha = 0.5
//        buttonEvolution.alpha = 0.5
    }
//    override func viewDidLayoutSubviews() {
//      super.viewDidLayoutSubviews()
//      if myCustomView == nil { // make it only once
//        myCustomView = Bundle.main.loadNibNamed("About", owner: self, options: nil)![0] as! About
//        //myCustomView.frame = ...
//        //self.view.addSubview(myCustomView) // you can omit 'self' here
//        // if your app support both Portrait and Landscape orientations
//        // you should add constraints here
//      }
//    }
        
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func showAbout(_ sender: UIButton) {
//        let image   = UIImage(named: "pokeball.svg")
//        sender.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        sender.setBackgroundImage(image, for: UIControl.State.normal)
//        self.pokeballAbout.isHidden = false
//        buttonAbout.alpha = 1.0
//        let testView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 568))
//        testView.addSubview(About())
//          testView.backgroundColor = .blue
//          testView.alpha = 0.5
//          testView.tag = 100
//          testView.isUserInteractionEnabled = true
//          self.view.addSubview(testView)
       // viewForPokemonData.addSubview(myCust    omView)
        self.viewAbout.isHidden = false
        self.viewStats.isHidden = true
        self.viewEvolution.isHidden = true
    }
    @IBAction func showStats(_ sender: UIButton) {
//        let image   = UIImage(named: "pokeball.svg")
//        sender.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        sender.setBackgroundImage(image, for: UIControl.State.normal)
        self.pokeballStats.isHidden = false
        buttonStats.alpha = 1.0
        self.viewStats.isHidden = false
        self.viewAbout.isHidden = true
        self.viewEvolution.isHidden = true
    }
    @IBAction func showEvolution(_ sender: UIButton) {
//        let image   = UIImage(named: "pokeball.svg")
//        sender.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        sender.setBackgroundImage(image, for: UIControl.State.normal)
        self.pokeballEvolution.isHidden = false
        buttonEvolution.alpha = 1.0
        self.viewEvolution.isHidden = false
        self.viewStats.isHidden = true
        self.viewAbout.isHidden = true
    }
    @IBAction func boton1(_ sender: Any) {
        
    }
    @IBAction func boton2(_ sender: Any) {
        
    }
}

extension DetailView: DetailViewProtocol {
    func showPokemonTraining(evYield: String, catchRate: String, baseFriendship: String, baseExperience: String, growthRate: String) {
       // let temp = evYield.camelizedDash
//        self.evYieldLabel.text = temp.camelized
//        self.catchRateLabel.text = catchRate
//        self.baseFriendshipLabel.text = baseFriendship
//        self.baseExpLabel.text = baseExperience
//        self.growthRateLabel.text = growthRate.camelizedDash
    }
    func showFailPokemonTraining() {
//        let alert = UIAlertController(title: "Pokemon Training Error", message: "Could not fetch pokemon training", preferredStyle: .alert)
//        let cancel = UIAlertAction(title: "dismiss", style: .default, handler: nil)
//        alert.addAction(cancel)
//        self.present(alert, animated: true, completion: nil)
    }
}
