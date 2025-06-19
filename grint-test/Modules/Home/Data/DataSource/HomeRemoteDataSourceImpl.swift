//
//  HomeRemoteDataSourceImpl.swift
//  grint-test
//
//  Created by Neptali Duque on 6/18/25.
//

final class HomeRemoteDataSourceImpl: HomeRemoteDataSource {
    private let networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }

    func fetchPosts(page: String?) async -> Result<ApiRedditPostResponse, any Error> {
        let queryParams = page.map { ["after": $0] } ?? [:]

        return await networkManager.requestNoParams(
            path: NetworkConstants.Top.topPosts,
            method: .get,
            queryParameters: queryParams
        )
    }
}
