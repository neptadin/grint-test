//
//  HomeDomainMapperImpl.swift
//  grint-test
//
//  Created by Neptali Duque on 6/19/25.
//

struct HomeDomainMapperImpl: HomeDomainMapper {
    private enum Constants {
        static let thumbnailUrlCheck = "i.redd.it"
    }

    func domainToPresentation(_ value: RedditPostsEntry) -> UiRedditPostsEntry {
        let posts = value.posts.map {
            UiRedditPost(
                title: $0.title,
                author: $0.author,
                created: $0.created,
                urlIsThumbnailPreview: $0.url.contains(Constants.thumbnailUrlCheck),
                url: $0.url,
                ups: $0.ups,
                numComments: $0.numComments,
                subreddit: $0.subreddit,
                detailLink: $0.detailLink
            )
        }

        return .init(after: value.after, posts: posts)
    }
}
