//
//  ApiRedditPostResponse.swift
//  grint-test
//
//  Created by Neptali Duque on 6/18/25.
//

struct ApiRedditPostResponse: Decodable {
    let after: String?
    let before: String?
    let children: [ApiRedditPostChildren]
}
