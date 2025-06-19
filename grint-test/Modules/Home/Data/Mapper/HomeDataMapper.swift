//
//  HomeDataMapper.swift
//  grint-test
//
//  Created by Neptali Duque on 6/18/25.
//

protocol HomeDataMapper {
    func dataToDomain(_ value: ApiRedditPostResponse) -> RedditPostsEntry
}
