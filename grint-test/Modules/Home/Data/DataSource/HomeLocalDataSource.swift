//
//  HomeLocalDataSource.swift
//  grint-test
//
//  Created by Neptali Duque on 6/19/25.
//

protocol HomeLocalDataSource {
    func getLocalPosts() -> CodableRedditPostsEntry?
    func saveLocalPosts(posts: CodableRedditPostsEntry)
}
