//
//  HomeViewModel.swift
//  grint-test
//
//  Created by Neptali Duque on 6/19/25.
//

final class HomeViewModel {
    typealias Observer<T> = (T) -> Void

    private let fetchPostsUseCase: FetchPostsUseCase.Alias

    init(fetchPostsUseCase: FetchPostsUseCase.Alias) {
        self.fetchPostsUseCase = fetchPostsUseCase
    }

    private(set) var isFirstLoad = true
    private var nextPage: String?

    var onLoadingStateChanged: Observer<Bool>?
    var onPostsLoaded: Observer<[UiRedditPost]>?

    func loadPosts() {
        onLoadingStateChanged?(true)
        fetchPostsUseCase.execute(nextPage) { [weak self] result in
            guard let self else { return }
            defer {
                onLoadingStateChanged?(false)
                isFirstLoad = false
            }

            switch result {
            case let .success(postsEntry):
                nextPage = postsEntry.after
                onPostsLoaded?(postsEntry.posts)
            case .failure:
                debugPrint("Failure")
            }
        }
    }
}
