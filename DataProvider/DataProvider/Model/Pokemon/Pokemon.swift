//
//  Pokemon.swift
//  DataProvider
//
//  Created by Gizem Duman on 21.03.2023.
//

import Foundation

public struct Pokemon: Decodable {
    public let count: Int?
    public let next: String?
    public let previous: String?
    public let results: [PokemonItem]?
}
