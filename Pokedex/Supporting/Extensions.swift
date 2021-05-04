//
//  Extensions.swift
//  Pokedex
//
//  Created by user on 4/30/21.
//

import Foundation
import Apollo
import Kingfisher

extension GetAllPokemonsWithLimitQuery.Data.Pokemon {
    func getImage() -> UIImage? {
        var image: UIImage?
        let urlStr = "\(Constants.PokeApi.imageURL)\(self.id).png"
        let url = URL(string: urlStr)!
        let resource = ImageResource(downloadURL: url)
        KingfisherManager.shared.retrieveImage(with: resource) { result in
            switch result {
            case .success(let value):
                image = value.image
            case .failure(let error):
                print(error)
            }
        }
        return image
    }
}
