//
//  HTTPMethod.swift
//  grint-test
//
//  Created by Neptali Duque on 6/18/25.
//

import Alamofire

enum HTTPMethod {
    case get

    var alamofireHttpMethod: Alamofire.HTTPMethod {
        switch self {
        case .get: .get
        }
    }
}
