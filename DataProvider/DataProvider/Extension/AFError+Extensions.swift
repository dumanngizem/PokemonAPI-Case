//
//  AFError+Extensions.swift
//  DataProvider
//
//  Created by Gizem Duman on 21.03.2023.
//

import Foundation
import Alamofire

extension AFError {
    var isTimeout: Bool {
        if isSessionTaskError,
           let error = underlyingError as NSError?, error.code == NSURLErrorTimedOut {
            return true
        }
        return false
    }
}
