//
//  Entities.swift
//  grint-test
//
//  Created by Neptali Duque on 6/18/25.
//

struct ApiRedditPostResponse: Decodable {
    let after: String?
    let before: String?
    let children: [ApiRedditPostChildren]
}

struct ApiRedditPostChildren: Decodable {
    let data: ApiRedditPost
}

struct ApiRedditPost: Decodable {
    let title: String
    let author: String
    let created: Int
    let url: String
    let ups: Int
    let numComments: Int
    let subreddit: String
    let detailLink: String

    enum CodingKeys: String, CodingKey {
        case title
        case author
        case created
        case url
        case ups
        case numComments = "num_comments"
        case subreddit = "subreddit_name_prefixed"
        case detailLink = "permalink"
    }
}
