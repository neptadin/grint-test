//
//  HomeLocalDataSourceImpl.swift
//  grint-test
//
//  Created by Neptali Duque on 6/19/25.
//

final class HomeLocalDataSourceImpl: HomeLocalDataSource {
    private enum Constants {
        static let postsKey = "cachedPosts"
    }

    private let userDefaults: LocalStorage

    init(userDefaults: LocalStorage) {
        self.userDefaults = userDefaults
    }

    func getLocalPosts() -> CodableRedditPostsEntry? {
        userDefaults.load(CodableRedditPostsEntry.self, forKey: Constants.postsKey)
    }

    func saveLocalPosts(posts: CodableRedditPostsEntry) {
        userDefaults.save(posts, forKey: Constants.postsKey)
    }
}
