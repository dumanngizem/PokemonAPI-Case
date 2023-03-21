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
}
