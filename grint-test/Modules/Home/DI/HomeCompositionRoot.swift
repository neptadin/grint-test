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
        let homeViewController = storyboard.instantiateViewController(
            identifier: HomeViewController.identifier,
            creator: { coder in
                // Data
                let networkManager = AlamofireManagerImpl(session: AF)
                let remoteDataSource = HomeRemoteDataSourceImpl(networkManager: networkManager)
                let homeDataMapper = HomeDataMapperImpl()
                let homeRepository = HomeRepository(remote: remoteDataSource, mapper: homeDataMapper)

                // Domain
                let homeDomainMapper = HomeDomainMapperImpl()
                let fetchPostsUseCase = AnyAsyncUseCase(
                    FetchPostsUseCase(repository: homeRepository, mapper: homeDomainMapper)
                )

                return HomeViewController(coder: coder, fetchPostsUseCase: fetchPostsUseCase)
            }
        ) as! HomeViewController

        return homeViewController
    }
}
