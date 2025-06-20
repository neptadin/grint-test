//
//  UserDefaults.swift
//  grint-test
//
//  Created by Neptali Duque on 6/19/25.
//

import Foundation

extension UserDefaults {
    func codableObject<T: Codable>(dataType: T.Type, key: String) -> T? {
        guard let userDefaultData = data(forKey: key) else {
            return nil
        }
        return try? JSONDecoder().decode(T.self, from: userDefaultData)
    }

    func setCodableObject<T: Codable>(_ data: T?, forKey defaultName: String) {
        let encoded = try? JSONEncoder().encode(data)
        set(encoded, forKey: defaultName)
    }
}
