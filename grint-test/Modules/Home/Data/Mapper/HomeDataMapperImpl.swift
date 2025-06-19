//
//  HomeDataMapperImpl.swift
//  grint-test
//
//  Created by Neptali Duque on 6/18/25.
//

import Foundation

struct HomeDataMapperImpl: HomeDataMapper {
    func dataToDomain(_ value: ApiRedditPostResponse) -> RedditPostsEntry {
        let posts = value.children.compactMap {
            var size: CGSize?
            var thumbnail: String?

            if let url = $0.data.preview?.images.first?.source?.url,
               let width = $0.data.preview?.images.first?.source?.width,
               let height = $0.data.preview?.images.first?.source?.height {
                size = CGSize(width: width, height: height)
                thumbnail = url
            }

            return RedditPost(
                title: $0.data.title,
                author: $0.data.author,
                created: $0.data.created,
                ups: $0.data.ups,
                numComments: $0.data.numComments,
                subreddit: $0.data.subreddit,
                detailLink: $0.data.detailLink,
                thumbnail: thumbnail,
                size: size
            )
        }
        return .init(after: value.after, posts: posts)
    }
}
