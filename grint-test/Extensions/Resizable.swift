//
//  Resizable.swift
//  grint-test
//
//  Created by Neptali Duque on 6/19/25.
//

import UIKit

protocol ImageResizable { }

extension ImageResizable {
    func scaleImageToScreenWidth(imageSize: CGSize, offset: CGFloat = .zero) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width - offset
        let aspectRatio = imageSize.width / imageSize.height
        let scaledHeight = screenWidth / aspectRatio
        return CGSize(width: screenWidth, height: scaledHeight)
    }
}
