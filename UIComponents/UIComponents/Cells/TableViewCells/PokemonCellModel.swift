//
//  PokemonCellsCellModel.swift
//  UIComponents
//
//  Created by Gizem Duman on 21.03.2023.
//

import Foundation

public protocol PokemonCellDataSource: AnyObject {
    var index: Int? { get set }
    var title: String? { get set }
}

public protocol PokemonCellEventSource: AnyObject {
    
}

public protocol PokemonCellProtocol: PokemonCellDataSource, PokemonCellEventSource {
    
}

public final class PokemonCellModel: PokemonCellProtocol {
  
    public var index: Int?
    public var title: String?
    
    public init(index: Int? = nil, title: String? = nil) {
        self.index = index
        self.title = title
    }
}
