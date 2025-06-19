//
//  HomeRepository.swift
//  grint-test
//
//  Created by Neptali Duque on 6/18/25.
//

final class HomeRepository: HomeDataSource {
    private let remote: HomeRemoteDataSource
    private let mapper: HomeDataMapper

    init(remote: HomeRemoteDataSource, mapper: HomeDataMapper) {
        self.remote = remote
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
