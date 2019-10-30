//
//  RequestFactory.swift
//  Foreign Exchange
//
//  Created by Luann Marques Luna on 30/10/19.
//  Copyright © 2019 Luann Marques Luna. All rights reserved.
//

import Foundation

final class RequestFactory {
    
    enum Method: String {
        case GET
        case POST
        case PUT
        case DELETE
        case PATCH
    }
    
    static func request(method: Method, url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}
