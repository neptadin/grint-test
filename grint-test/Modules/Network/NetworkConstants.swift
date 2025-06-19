//
//  NetworkConstants.swift
//  grint-test
//
//  Created by Neptali Duque on 6/18/25.
//

enum NetworkConstants {
    static let baseUrl = "https://www.reddit.com"

    enum Top {
        private static let basePath = "/top"
        static let topPosts = "\(basePath)/.json"
    }
}
