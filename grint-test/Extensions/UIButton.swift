//
//  UIButton.swift
//  grint-test
//
//  Created by Neptali Duque on 6/19/25.
//

import UIKit

extension UIButton {
    func setAttributedTitle(_ title: NSAttributedString?) {
        setAttributedTitle(title, for: .application)
        setAttributedTitle(title, for: .disabled)
        setAttributedTitle(title, for: .focused)
        setAttributedTitle(title, for: .highlighted)
        setAttributedTitle(title, for: .normal)
        setAttributedTitle(title, for: .reserved)
        setAttributedTitle(title, for: .selected)
    }
}
