//
//  About.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 17/5/21.
//

import UIKit

class AboutView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var evYieldLabel: UILabel!
    @IBOutlet weak var catchRateLabel: UILabel!
    @IBOutlet weak var baseFriendhipLabel: UILabel!
    @IBOutlet weak var baseExperienceLabel: UILabel!
    @IBOutlet weak var trainingLabel: UILabel!
    @IBOutlet weak var growthRateLabel: UILabel!
    @IBOutlet weak var locationStackView: UIStackView!
    @IBOutlet weak var locationTitleLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    func initSubviews() {
        Bundle.main.loadNibNamed(Constants.DetailViewContent.aboutView, owner: self, options: nil)
        guard let content = contentView else { return }
        content.frame = self.bounds
        content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(content)
    }
    func showPokemonTraining(evYield: String, catchRate: String, baseFriendship: String, baseExperience: String, growthRate: String, trainingTextColor: String) {
        self.trainingLabel.textColor = UIColor(named: trainingTextColor)
        self.locationTitleLabel.textColor = UIColor(named: trainingTextColor)
        let formatEvYield = evYield.camelizedDash
        self.evYieldLabel.text = formatEvYield.camelized
        self.catchRateLabel.text = catchRate
        self.baseFriendhipLabel.text = baseFriendship
        self.baseExperienceLabel.text = baseExperience
        self.growthRateLabel.text = growthRate.camelizedDash
    }
    func showPokemonLocation(pokemonLocations: [GetPokemonDetailQuery.Data.PokemonV2Pokemonspecy.PokemonV2Pokemondexnumber]) {
        let sizeLocation = pokemonLocations.count
        for index in 0..<sizeLocation {
            let locationID = pokemonLocations[index].pokedexNumber
            let locationDescription = pokemonLocations[index].pokemonV2Pokedex?.pokemonV2Pokedexdescriptions[0].description
            if let safeDescription = locationDescription {
                if !safeDescription.isEmpty {
                    self.addNewData(id: String(locationID), location: safeDescription)
                }
            }
        }
    }
    func addNewData(id: String, location: String) {
        // El eje Y siempre va ser el que cambia
        let newView = UIView()
        let idLabel = UILabel()
        let locationLabel = UILabel()
        locationStackView.addArrangedSubview(newView)
        newView.addSubview(idLabel)
        newView.addSubview(locationLabel)
        // adding constraints
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        idLabel.text = id
        idLabel.font = UIFont(name: Constants.PokemonFontFamily.fontName, size: 12)
        locationLabel.numberOfLines = 0
        locationLabel.font = UIFont(name: Constants.PokemonFontFamily.fontName, size: 16)
        locationLabel.text = "(\(location))"
        let idLabelTopConstraint = NSLayoutConstraint(item: idLabel, attribute: .top, relatedBy: .equal, toItem: newView, attribute: .top, multiplier: 1, constant: 2.5)
        newView.addConstraint(idLabelTopConstraint)
        locationConstraints(locationLabel: locationLabel, newView: newView)
    }
    func locationConstraints(locationLabel: UILabel, newView: UIView) {
        let leadingLocation = NSLayoutConstraint(item: locationLabel, attribute: .leading, relatedBy: .equal, toItem: newView, attribute: .leading, multiplier: 1, constant: 110)
        let topLocation = NSLayoutConstraint(item: locationLabel, attribute: .top, relatedBy: .equal, toItem: newView, attribute: .top, multiplier: 1, constant: 0)
        let trailingLocation = NSLayoutConstraint(item: locationLabel, attribute: .trailing, relatedBy: .equal, toItem: newView, attribute: .trailing, multiplier: 1, constant: 0)
        let bottomLocation = NSLayoutConstraint(item: locationLabel, attribute: .bottom, relatedBy: .equal, toItem: newView, attribute: .bottom, multiplier: 1, constant: 10)
        newView.addConstraint(leadingLocation)
        newView.addConstraint(topLocation)
        newView.addConstraint(trailingLocation)
        newView.addConstraint(bottomLocation)
    }
}
