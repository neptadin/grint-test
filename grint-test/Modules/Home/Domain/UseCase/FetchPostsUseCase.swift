//
//  FetchPostsUseCase.swift
//  grint-test
//
//  Created by Neptali Duque on 6/19/25.
//

final class FetchPostsUseCase: AsyncUseCase {
    typealias Input = String?
    typealias Output = UiRedditPostsEntry
    typealias Alias = AnyAsyncUseCase<Input, Output>

    private let repository: HomeDataSource
    private let mapper: HomeDomainMapper

    init(repository: HomeDataSource, mapper: HomeDomainMapper) {
        self.repository = repository
        self.mapper = mapper
    }

    func execute(_ input: Input, _ onCompletion: @escaping (Result<Output, Error>) -> Void) {
        Task {
            let domainPosts = await repository.fetchPosts(page: input)
            let presentationPosts = domainPosts.map { [mapper] result in
                mapper.domainToPresentation(result)
            }

            await MainActor.run {
                onCompletion(presentationPosts)
            }
        }
    }
}
