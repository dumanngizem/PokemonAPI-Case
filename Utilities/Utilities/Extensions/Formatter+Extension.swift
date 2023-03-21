//
//  Formatter+Extension.swift
//  Utilities
//
//  Created by Gizem Duman on 21.03.2023.
//

import Foundation

public extension Formatter {
    
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        return formatter
    }()
}
