//
//  APIDecodableResponseRequest.swift
//  DataProvider
//
//  Created by Gizem Duman on 21.03.2023.
//

public protocol PACRequest: DecodableResponseRequest {}

// MARK: - RequestEncoding
public extension PACRequest {
    var encoding: RequestEncoding {
        switch method {
        case .get:
            return .url
        default:
            return .json
        }
    }
}

// MARK: - url
public extension PACRequest {
    var url: String {
        return "https://pokeapi.co/api/v2/" + path
    }
}

// MARK: - RequestParameters
public extension PACRequest {
    var parameters: RequestParameters {
        return [:]
    }
}

// MARK: - RequestHeaders
public extension PACRequest {
    var headers: RequestHeaders {
        return [:]
    }
}
