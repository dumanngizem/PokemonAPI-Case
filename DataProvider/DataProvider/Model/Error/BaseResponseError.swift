//
//  BaseResponseError.swift
//  DataProvider
//
//  Created by Gizem Duman on 21.03.2023.
//

import Foundation

public enum BaseErrorType: String {
    case registerFailed = "register_failed"
    case registerMissingParams = "register_failed_required_params_missing"
    case nytInvalidToken = "pac_invalid_token"
    case unknown
}

extension BaseErrorType: Codable {
    public init(from decoder: Decoder) throws {
        self = try BaseErrorType(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }
}

public struct BaseErrorResponse: Decodable, Error, LocalizedError {
    public let code: BaseErrorType?
    public let message: String?
    
    public var errorDescription: String? {
        return message
    }
}
