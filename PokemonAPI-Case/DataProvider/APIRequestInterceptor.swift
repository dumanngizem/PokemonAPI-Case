//
//  APIRequestInterceptor.swift
//  PokemonAPI-Case
//
//  Created by Gizem Duman on 21.03.2023.
//

import Alamofire

public class APIRequestInterceptor: RequestInterceptor {
    
    public static let shared = APIRequestInterceptor()
    let retryLimit = 1
    
    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        let adaptedRequest = urlRequest
        completion(.success(adaptedRequest))
    }
}
