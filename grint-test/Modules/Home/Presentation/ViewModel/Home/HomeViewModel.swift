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
    var onErrorStateChanged: Observer<Bool>?
    var onPostsLoaded: Observer<[UiRedditPost]>?


    func loadPosts() {
        onLoadingStateChanged?(true)
        onErrorStateChanged?(false)

        fetchPostsUseCase.execute((nextPage, isFirstLoad)) { [weak self] result in
            guard let self else { return }

            switch result {
            case let .success(postsEntry):
                nextPage = postsEntry.after
                onPostsLoaded?(postsEntry.posts)
                onLoadingStateChanged?(false)
                isFirstLoad = false
            case .failure:
                onLoadingStateChanged?(false)
                onErrorStateChanged?(true)
            }
        }
    }
}
