//
//  HomeCompositionRoot.swift
//  grint-test
//
//  Created by Neptali Duque on 6/18/25.
//

import UIKit

final class HomeCompositionRoot {
    static func makeHomeViewController() -> HomeViewController {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)

        guard
            let homeViewController = storyboard.instantiateViewController(
                identifier: HomeViewController.identifier) as? HomeViewController
        else {
            fatalError("HomeViewController not found")
        }

        return homeViewController
    }
}
