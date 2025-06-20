//
//  UIViewController.swift
//  grint-test
//
//  Created by Neptali Duque on 6/19/25.
//

import UIKit

extension UIViewController {
    func setNavigationBarLogo() {
        let imageView = UIImageView(image: .init(named: "reddit-logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 23).isActive = true

        let barButtonItem = UIBarButtonItem(customView: imageView)
        navigationItem.leftBarButtonItem = barButtonItem
    }
}
