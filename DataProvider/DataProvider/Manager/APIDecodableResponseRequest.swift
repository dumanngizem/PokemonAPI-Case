//
//  APIDecodableResponseRequest.swift
//  DataProvider
//
//  Created by Gizem Duman on 21.03.2023.
//

public protocol SMRequest: DecodableResponseRequest {}

// MARK: - RequestEncoding
public extension SMRequest {
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
public extension SMRequest {
    var url: String {
        return "https://www.omdbapi.com/?apikey=5d8b9e8c" + path
    }
}

// MARK: - RequestParameters
public extension SMRequest {
    var parameters: RequestParameters {
        return [:]
    }
}

// MARK: - RequestHeaders
public extension SMRequest {
    var headers: RequestHeaders {
        return [:]
    }
}
