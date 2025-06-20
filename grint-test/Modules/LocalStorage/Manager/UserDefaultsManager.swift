//
//  UserDefaultsManager.swift
//  grint-test
//
//  Created by Neptali Duque on 6/19/25.
//

import Foundation

final class UserDefaultsManager: LocalStorage {
    private let userDefaults: UserDefaults

    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }

    func save<T: Codable>(_ value: T, forKey key: String) {
        switch value.self {
        case is String:
            userDefaults.set(value, forKey: key)
        case is Int:
            userDefaults.set(value, forKey: key)
        case is Bool:
            userDefaults.set(value, forKey: key)
        case is Double:
            userDefaults.set(value, forKey: key)
        case is Float:
            userDefaults.set(value, forKey: key)
        case is Data:
            userDefaults.set(value, forKey: key)
        default:
            userDefaults.setCodableObject(value, forKey: key)
        }
    }

    func load<T: Codable>(_ type: T.Type, forKey key: String) -> T? {
        if let value = userDefaults.value(forKey: key) as? T {
            return value
        }
        return userDefaults.codableObject(dataType: type, key: key)
    }
}
