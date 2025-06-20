//
//  FetchPostsUseCase.swift
//  grint-test
//
//  Created by Neptali Duque on 6/19/25.
//

final class FetchPostsUseCase: AsyncUseCase {
    typealias Input = (nextPage: String?, isFirstLoad: Bool)
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
            let domainResult = await fetchWithFallback(input: input)
            let presentationResult = domainResult.map { [mapper] result in
                mapper.domainToPresentation(result)
            }
            await MainActor.run {
                onCompletion(presentationResult)
            }
        }
    }

    private func fetchWithFallback(input: Input) async -> Result<RedditPostsEntry, Error> {
        let result = await repository.fetchPosts(page: input.nextPage)

        switch result {
        case .success(let posts):
            if input.isFirstLoad {
                repository.saveLocalPosts(posts)
            }
            return .success(posts)

        case .failure(let error):
            guard
                let fallbackPosts = repository.getLocalPosts(), input.isFirstLoad
            else {
                return .failure(error)
            }

            return .success(fallbackPosts)
        }
    }
}
