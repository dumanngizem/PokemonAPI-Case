//
//  DataProviderProtocol.swift
//  DataProvider
//
//  Created by Gizem Duman on 21.03.2023.
//

public typealias DataProviderResult<T: Decodable> = ((Result<T, NetworkError>) -> Void)

public protocol DataProviderProtocol {
    
    func request<T: DecodableResponseRequest>(for request: T,
                                              result: DataProviderResult<T.ResponseType>?)
    func uploadRequest<T: DecodableResponseRequest>(for request: T,
                                                    files: [MultiPartFileData],
                                                    result: DataProviderResult<T.ResponseType>?)
}
