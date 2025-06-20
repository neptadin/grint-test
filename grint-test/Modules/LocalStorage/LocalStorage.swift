//
//  LocalStorage.swift
//  grint-test
//
//  Created by Neptali Duque on 6/19/25.
//

protocol LocalStorage {
    func save<T: Codable>(_ value: T, forKey key: String)
    func load<T: Codable>(_ type: T.Type, forKey key: String) -> T?
}
