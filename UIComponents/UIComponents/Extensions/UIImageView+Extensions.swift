//
//  UIImageView+Extensions.swift
//  UIComponents
//
//  Created by Gizem Duman on 21.03.2023.
//

import Foundation
import Kingfisher

public extension UIImageView {
    
    func setKFImage(_ urlString: String) {
        let url = URL(string: urlString)
        let placeHolder: UIImage = .imgPlaceholder
        self.kf.setImage(with: url, placeholder: placeHolder)
    }
    
    func setKFPokemonImage(index: Int) {
        let increaseIndex = index + 1
        let imageString = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(increaseIndex).png"
        let url = URL(string: imageString)
        let placeHolder: UIImage = .imgPlaceholder
        self.kf.setImage(with: url, placeholder: placeHolder)
    }
}
