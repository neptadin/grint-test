//
//  Reusable.swift
//  grint-test
//
//  Created by Neptali Duque on 6/18/25.
//

protocol Reusable {
    static var identifier: String { get }
}

extension Reusable {
    static var identifier: String {
        String(describing: self)
    }
}
