//
//  NetworkEntities.swift
//  grint-test
//
//  Created by Neptali Duque on 6/18/25.
//

struct NetworkPayload<T: Decodable>: Decodable {
    let kind: String
    let data: T
}
