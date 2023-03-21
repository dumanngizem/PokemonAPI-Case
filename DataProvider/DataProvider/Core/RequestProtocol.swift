//
//  RequestProtocol.swift
//  DataProvider
//
//  Created by Gizem Duman on 21.03.2023.
//

public protocol RequestProtocol {
    var path: String { get }
    var method: RequestMethod { get }
    var parameters: RequestParameters { get }
    var headers: RequestHeaders { get }
    var encoding: RequestEncoding { get }
    var url: String { get }
}
