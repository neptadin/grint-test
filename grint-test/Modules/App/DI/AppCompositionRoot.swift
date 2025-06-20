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

    static func configureAppNavigationAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        let navBar = UINavigationBar.appearance()
        navBar.standardAppearance = appearance
        navBar.scrollEdgeAppearance = appearance
        navBar.compactAppearance = appearance

        if #available(iOS 15.0, *) {
            navBar.compactScrollEdgeAppearance = appearance
        }
    }
}
