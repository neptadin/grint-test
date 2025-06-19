//
//  NSMutableAttributedString.swift
//  grint-test
//
//  Created by Neptali Duque on 6/19/25.
//

import UIKit

extension NSMutableAttributedString {
    func underlined() {
        let range: NSRange = self.mutableString.range(
            of: self.string,
            options: .caseInsensitive)
        self.addAttribute(
            .underlineStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: range)
    }

    func set(foreground: UIColor) {
        let range: NSRange = self.mutableString.range(
            of: self.string,
            options: .caseInsensitive)
        self.addAttribute(
            .foregroundColor,
            value: foreground,
            range: range)
    }

    func set(font: UIFont) {
        let range: NSRange = self.mutableString.range(
            of: self.string,
            options: .caseInsensitive)
        self.addAttribute(
            .font,
            value: font,
            range: range)
    }

    func set(paragraph: NSParagraphStyle) {
        let range: NSRange = self.mutableString.range(
            of: self.string,
            options: .caseInsensitive)
        self.addAttribute(
            .paragraphStyle,
            value: paragraph,
            range: range)
    }
}
