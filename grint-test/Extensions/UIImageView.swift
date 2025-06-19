//
//  UIImageView.swift
//  grint-test
//
//  Created by Neptali Duque on 6/19/25.
//

import UIKit
import SDWebImage

extension UIImageView {
    func setImage(url: String) {
        guard let url = URL(string: url) else { return }
        sd_setImage(with: url)
    }
}
