//
//  DecodableResponseRequest.swift
//  DataProvider
//
//  Created by Gizem Duman on 21.03.2023.
//

public protocol DecodableResponseRequest: RequestProtocol {
    associatedtype ResponseType: Decodable
}
