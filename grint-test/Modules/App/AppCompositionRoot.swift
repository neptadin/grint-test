//
//  AppCompositionRoot.swift
//  grint-test
//
//  Created by Neptali Duque on 6/18/25.
//

import UIKit

final class AppCompositionRoot {
    static func configureApp(window: UIWindow) {
        let homeViewController = HomeCompositionRoot.makeHomeViewController()
        let nav = UINavigationController(rootViewController: homeViewController)
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
}
