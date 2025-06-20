//
//  HomeRepository.swift
//  grint-test
//
//  Created by Neptali Duque on 6/18/25.
//

final class HomeRepository: HomeDataSource {
    private let remote: HomeRemoteDataSource
    private let local: HomeLocalDataSource
    private let mapper: HomeDataMapper

    init(
        remote: HomeRemoteDataSource,
        local: HomeLocalDataSource,
        mapper: HomeDataMapper
    ) {
        self.remote = remote
        self.local = local
        self.mapper = mapper
    }

    func fetchPosts(page: String?) async -> Result<RedditPostsEntry, any Error> {
        let dataPosts = await remote.fetchPosts(page: page)

        let domainPosts = dataPosts.map { [mapper] result in
            mapper.dataToDomain(result)
        }

        return domainPosts
    }
}

// MARK: - Local
extension HomeRepository {
    func getLocalPosts() -> RedditPostsEntry? {
        let localPosts = local.getLocalPosts()
        return mapper.dataToDomain(localPosts)
    }

    func saveLocalPosts(_ posts: RedditPostsEntry) {
        let localPosts = mapper.domainToData(posts)
        local.saveLocalPosts(posts: localPosts)
    }
}
