//
//  UITableView.swift
//  grint-test
//
//  Created by Neptali Duque on 6/19/25.
//

import UIKit

extension UITableView {
    func registerNib<T: Reusable>(for reusableCell: T.Type) {
        let nib = UINib(nibName: T.identifier, bundle: nil)
        register(nib, forCellReuseIdentifier: T.identifier)
    }

    func dequeueReusableCell<T: Reusable>(for reusableCell: T.Type) -> T {
        let cell = dequeueReusableCell(withIdentifier: T.identifier) as! T
        return cell
    }
}
