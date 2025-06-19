//
//  HomeDomainMapper.swift
//  grint-test
//
//  Created by Neptali Duque on 6/19/25.
//

protocol HomeDomainMapper {
    func domainToPresentation(_ value: RedditPostsEntry) -> UiRedditPostsEntry
}
