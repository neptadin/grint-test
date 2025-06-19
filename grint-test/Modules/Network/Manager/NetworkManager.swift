//
//  NetworkManager.swift
//  grint-test
//
//  Created by Neptali Duque on 6/18/25.
//

protocol NetworkManager {
    func requestNoParams<R: Decodable>(
        path: String,
        method: HTTPMethod,
        queryParameters: [String: String]
    ) async -> Result<R, Error>
}
