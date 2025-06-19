//
//  HomeRemoteDataSource.swift
//  grint-test
//
//  Created by Neptali Duque on 6/18/25.
//

protocol HomeRemoteDataSource {
    func fetchPosts(page: String?) async -> Result<ApiRedditPostResponse, Error>
}
