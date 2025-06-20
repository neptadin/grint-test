//
//  HomeDataSource.swift
//  grint-test
//
//  Created by Neptali Duque on 6/18/25.
//

protocol HomeDataSource {
    // Remote
    func fetchPosts(page: String?) async -> Result<RedditPostsEntry, Error>

    // Local
    func getLocalPosts() -> RedditPostsEntry?
    func saveLocalPosts(_ posts: RedditPostsEntry)
}
