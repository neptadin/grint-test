//
//  ApiRedditPost.swift
//  grint-test
//
//  Created by Neptali Duque on 6/18/25.
//

struct ApiRedditPost: Decodable {
    let title: String
    let author: String
    let created: Int
    let ups: Int
    let numComments: Int
    let subreddit: String
    let detailLink: String
    let preview: ApiRedditPostPreview?

    enum CodingKeys: String, CodingKey {
        case title
        case author
        case created
        case ups
        case numComments = "num_comments"
        case subreddit = "subreddit_name_prefixed"
        case detailLink = "permalink"
        case preview
    }
}

struct ApiRedditPostPreview: Decodable {
    let images: [ApiRedditPostSourceImage]
}

struct ApiRedditPostSourceImage: Decodable {
    let source: ApiRedditPostImageSize?
}

struct ApiRedditPostImageSize: Decodable {
    let url: String?
    let width: Int?
    let height: Int?
}
