//
//  StringProtocol+Extensions.swift
//  Utilities
//
//  Created by Gizem Duman on 22.03.2023.
//

import Foundation

public extension StringProtocol {
    var firstUppercased: String { return prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { return prefix(1).capitalized + dropFirst() }
}
