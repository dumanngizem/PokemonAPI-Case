//
//  String+Extensions.swift
//  Utilities
//
//  Created by Gizem Duman on 21.03.2023.
//

import Foundation

public extension String {
    
    var nytUrl: URL? {
        let stringUrl = self.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        if let stringUrl = stringUrl {
            return URL(string: stringUrl)
        } else {
            return nil
        }
    }
}
