//
//  Url+Extensions.swift
//  Utilities
//
//  Created by Gizem Duman on 21.03.2023.
//

import Foundation
import UIKit

public extension URL {
    
    func openURL() {
        if UIApplication.shared.canOpenURL(self) {
            UIApplication.shared.open(self)
        }
    }
}
