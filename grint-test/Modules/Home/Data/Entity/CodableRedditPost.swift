//
//  CodableRedditPost.swift
//  grint-test
//
//  Created by Neptali Duque on 6/19/25.
//

import Foundation

struct CodableRedditPost: Codable {
    let title: String
    let author: String
    let created: Int
    let ups: Int
    let numComments: Int
    let subreddit: String
    let detailLink: String
    let thumbnail: String?
    let size: CGSize?
}
