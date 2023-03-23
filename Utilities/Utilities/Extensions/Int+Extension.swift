//
//  Int+Extension.swift
//  Utilities
//
//  Created by Gizem Duman on 21.03.2023.
//

import Foundation

public extension Int {
    
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}
