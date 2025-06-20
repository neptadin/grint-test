//
//  HomeCompositionRoot.swift
//  grint-test
//
//  Created by Neptali Duque on 6/18/25.
//

import UIKit
import Alamofire

final class HomeCompositionRoot {
    static func makeHomeViewController() -> HomeViewController {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let homeViewController: HomeViewController = storyboard.instantiateViewController(
            identifier: HomeViewController.identifier,
            creator: { coder in
                // Data
                let networkManager = AlamofireManagerImpl(session: AF)
                let remoteDataSource = HomeRemoteDataSourceImpl(networkManager: networkManager)
                let localStorage = UserDefaultsManager(userDefaults: .standard)
                let localDataSource = HomeLocalDataSourceImpl(userDefaults: localStorage)
                let homeDataMapper = HomeDataMapperImpl()
                let homeRepository = HomeRepository(
                    remote: remoteDataSource,
                    local: localDataSource,
                    mapper: homeDataMapper
                )

                // Domain
                let homeDomainMapper = HomeDomainMapperImpl()
                let fetchPostsUseCase = AnyAsyncUseCase(
                    FetchPostsUseCase(repository: homeRepository, mapper: homeDomainMapper)
                )

                // Presentation
                let homeViewModel = HomeViewModel(fetchPostsUseCase: fetchPostsUseCase)
                return HomeViewController(coder: coder, viewModel: homeViewModel)
            }
        )

        homeViewController.viewModel.onPostsLoaded = adaptPostsToCellControllers(forwardingTo: homeViewController)

        return homeViewController
    }

    private static func adaptPostsToCellControllers(forwardingTo controller: HomeViewController) -> ([UiRedditPost]) -> Void {
        return { [weak controller] posts in
            controller?.tableModel = (controller?.tableModel ?? []) + posts.map {
                HomePostController(
                    viewModel: .init(
                        model: $0,
                        onCellTap: { detailLink in
                            let postDetailViewController = makePostDetailViewController(detailLink: detailLink)
                            controller?.navigationController?.pushViewController(postDetailViewController, animated: true)
                        }
                    )
                )
            }
        }
    }
}

extension HomeCompositionRoot {
    static func makePostDetailViewController(detailLink: String) -> PostDetailViewController {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let postDetailViewController: PostDetailViewController = storyboard.instantiateViewController(
            identifier: PostDetailViewController.identifier,
            creator: { coder in
                // Presentation
                let postDetailViewModel = PostDetailViewModel(urlString: detailLink)
                return PostDetailViewController(coder: coder, viewModel: postDetailViewModel)
            }
        )

        return postDetailViewController
    }
}
