//
//  PokemonRequest.swift
//  DataProvider
//
//  Created by Gizem Duman on 21.03.2023.
//

public struct PokemonRequest: PACRequest {
    
    public typealias ResponseType = Pokemon
    
    public var path: String = "pokemon"
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init() {
        parameters = ["limit": 40]
    }
}
