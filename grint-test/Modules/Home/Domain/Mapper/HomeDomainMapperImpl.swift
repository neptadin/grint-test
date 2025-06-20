//
//  HomeDomainMapperImpl.swift
//  grint-test
//
//  Created by Neptali Duque on 6/19/25.
//

struct HomeDomainMapperImpl: HomeDomainMapper {
    private enum Constants {
        static let amp = "amp;"
        static let redditUrl = "https://www.reddit.com"
    }

    func domainToPresentation(_ value: RedditPostsEntry) -> UiRedditPostsEntry {
        let posts = value.posts.map {
            let cleansedThumbnail = $0.thumbnail?.replacingOccurrences(of: Constants.amp, with: "")
            let completeDetailLink = Constants.redditUrl + $0.detailLink
            return UiRedditPost(
                title: $0.title,
                author: $0.author,
                created: $0.created,
                ups: $0.ups,
                numComments: $0.numComments,
                subreddit: $0.subreddit,
                detailLink: completeDetailLink,
                thumbnail: cleansedThumbnail,
                size: $0.size
            )
        }

        return .init(after: value.after, posts: posts)
    }
}
