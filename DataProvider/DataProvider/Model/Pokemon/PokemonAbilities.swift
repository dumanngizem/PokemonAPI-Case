//
//  PokemonAbilities.swift
//  DataProvider
//
//  Created by Gizem Duman on 22.03.2023.
//

import Foundation

public struct PokemonAbilities: Decodable {
    public let ability: PokemonAbilityElement?
    public let isHidden: Bool?
    public let slot: Int?
    
    public enum CodingKeys: String, CodingKey {
        case ability, slot
        case isHidden = "is_hidden"
    }
}
