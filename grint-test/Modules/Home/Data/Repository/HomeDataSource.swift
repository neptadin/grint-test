//
//  HomeDataSource.swift
//  grint-test
//
//  Created by Neptali Duque on 6/18/25.
//

protocol HomeDataSource {
    func fetchPosts(page: String?) async -> Result<RedditPostsEntry, Error>
}
