//
//  UiRedditPost.swift
//  grint-test
//
//  Created by Neptali Duque on 6/19/25.
//

import Foundation

struct UiRedditPost {
    let title: String
    let author: String
    let created: Int
    let urlIsThumbnailPreview: Bool
    let url: String
    let ups: Int
    let numComments: Int
    let subreddit: String
    let detailLink: String
    let size: CGSize?
}
