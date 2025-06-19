//
//  HomeDataMapperImpl.swift
//  grint-test
//
//  Created by Neptali Duque on 6/18/25.
//

struct HomeDataMapperImpl: HomeDataMapper {
    func dataToDomain(_ value: ApiRedditPostResponse) -> RedditPostsEntry {
        let posts = value.children.compactMap {
            RedditPost(
                title: $0.data.title,
                author: $0.data.author,
                created: $0.data.created,
                url: $0.data.url,
                ups: $0.data.ups,
                numComments: $0.data.numComments,
                subreddit: $0.data.subreddit,
                detailLink: $0.data.detailLink
            )
        }
        return .init(after: value.after, posts: posts)
    }
}
