// created by: Christian Torrico Avila

import UIKit

class CustomPokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var patterBackground: UIImageView!
    @IBOutlet weak var patternPoints: UIImageView!
    @IBOutlet weak var idPokemon: UILabel!
    @IBOutlet weak var namePokemon: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var backgroundType1: UIImageView!
    @IBOutlet weak var typeImage1: UIImageView!
    @IBOutlet weak var pokemonType1: UILabel!
    @IBOutlet weak var backgroundType2: UIImageView!
    @IBOutlet weak var typeImage2: UIImageView!
    @IBOutlet weak var pokemonType2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        print("Se ejecuto el awakeFromNib")
        self.patterBackground.tintColor = UIColor.white
        self.patternPoints.tintColor = UIColor.white
        cellView.layer.cornerRadius = 10
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func updateContent(pokemonId: String, pokemonName: String, types: [String], pokemonImage: UIImage ) {
        self.idPokemon.text = getIdFormatted(id: pokemonId)
        self.namePokemon.text = pokemonName
        self.pokemonImage.image = pokemonImage
        updateTypeContent(types: types)
        addGradient(myView: patternPoints,colorName: types[0])
        changeBackground(pokemonType: types[0])
    }
    func getIdFormatted(id: String) -> String {
        let size = id.count
        switch size {
        case 1:
            return "#00\(id)"
        case 2:
            return "#0\(id)"
        default:
            return "#\(id)"
        }
    }
    func changeBackground(pokemonType: String) {
        self.cellView.backgroundColor = UIColor(named: "back-\(pokemonType)")
    }
    func updateTypeContent(types: [String]) {
        backgroundType1.backgroundColor = UIColor(named: types[0])
        backgroundType1.layer.cornerRadius = 7
        typeImage1.image = UIImage(named: types[0])
        pokemonType1.text = types[0]
        if types.count > 1 {
            backgroundType2.backgroundColor = UIColor(named: types[1])
            backgroundType2.layer.cornerRadius = 7
            typeImage2.image = UIImage(named: types[1])
            pokemonType2.text = types[1]
        }
    }
    func addGradient(myView: UIView, colorName: String) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: myView.frame.width, height: myView.frame.height)
        gradientLayer.colors = [UIColor(named: "back-\(colorName)")?.cgColor,UIColor(named: "back-\(colorName)")!.withAlphaComponent(0.1).cgColor]
                gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
                gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        myView.layer.addSublayer(gradientLayer)
    }
}
