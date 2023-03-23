//
//  PokemonDetailRequest.swift
//  DataProvider
//
//  Created by Gizem Duman on 22.03.2023.
//

public struct PokemonDetailRequest: PACRequest {
    
    public typealias ResponseType = PokemonDetail
    
    public var path: String = ""
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(name: String) {
        path = "pokemon/\(name)"
    }
    
}
