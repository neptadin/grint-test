//
//  HomeCompositionRoot.swift
//  grint-test
//
//  Created by Neptali Duque on 6/18/25.
//

import UIKit

final class HomeCompositionRoot {
    private enum Constants {
        static let homeIdentifier = HomeViewController.identifier
    }

    static func makeHomeViewController() -> HomeViewController {
        let storyboard = UIStoryboard(name: "Home", bundle: .main)

        guard
            let homeViewController = storyboard.instantiateViewController(
                identifier: Constants.homeIdentifier) as? HomeViewController
        else {
            fatalError("HomeViewController not found")
        }

        return homeViewController
    }
}
