//
//  CodableRedditPostsEntry.swift
//  grint-test
//
//  Created by Neptali Duque on 6/19/25.
//

struct CodableRedditPostsEntry: Codable {
    let after: String?
    let posts: [CodableRedditPost]
}
