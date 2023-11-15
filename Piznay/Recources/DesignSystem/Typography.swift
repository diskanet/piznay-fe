//
//  Typography.swift
//  Piznay
//
//  Created by Dima Kahanets on 07.10.2023.
//

import Foundation
import UIKit

struct Typography {
    let name: String
    let size: CGFloat
    let weight: UIFont.Weight
    let lineHeight: CGFloat
    let lineHeightMultiple: CGFloat
    let tracking: CGFloat
    
    static let largeTitle = Typography(
        name: "Large Title",
        size: 34,
        weight: .medium,
        lineHeight: 41,
        lineHeightMultiple: 0.83,
        tracking: 0.40
    )
    
    static let title1 = Typography(
        name: "Title 1",
        size: 28,
        weight: .medium,
        lineHeight: 34,
        lineHeightMultiple: 0.84,
        tracking: 0.38
    )
    
    static let title2 = Typography(
        name: "Title 2",
        size: 22,
        weight: .medium,
        lineHeight: 28,
        lineHeightMultiple: 0.88,
        tracking: -0.26
    )
    
    static let title3 = Typography(
        name: "Title 3",
        size: 20,
        weight: .medium,
        lineHeight: 25,
        lineHeightMultiple: 0.86,
        tracking: -0.45
    )
    
    static let headline = Typography(
        name: "Headline",
        size: 17,
        weight: .medium,
        lineHeight: 22,
        lineHeightMultiple: 0.89,
        tracking: -0.43
    )
    
    static let body = Typography(
        name: "Body",
        size: 17,
        weight: .regular,
        lineHeight: 22,
        lineHeightMultiple: 0.89,
        tracking: -0.43
    )
    
    static let callout = Typography(
        name: "Callout",
        size: 16,
        weight: .regular,
        lineHeight: 21,
        lineHeightMultiple: 0.91,
        tracking: -0.31
    )
    
    static let subtitleBody2R = Typography(
        name: "Subhead | Body 2R",
        size: 15,
        weight: .regular,
        lineHeight: 20,
        lineHeightMultiple: 1.33,
        tracking: -0.23
    )
    
    static let subtitleBody2M = Typography(
        name: "Subtitle | Body 2M",
        size: 15,
        weight: .medium,
        lineHeight: 20,
        lineHeightMultiple: 0.92,
        tracking: -0.23
    )
    
    static let footnoteSubtitle2R = Typography(
        name: "Footnote | Subtitle 2R",
        size: 13,
        weight: .regular,
        lineHeight: 18,
        lineHeightMultiple: 0.95,
        tracking: -0.08
    )
    
    static let caption1R = Typography(
        name: "Caption 1R",
        size: 12,
        weight: .regular,
        lineHeight: 16,
        lineHeightMultiple: 0.92,
        tracking: 0
    )
    
    static let caption1M = Typography(
        name: "Caption 1M",
        size: 12,
        weight: .medium,
        lineHeight: 16,
        lineHeightMultiple: 0.92,
        tracking: 0
    )
    
    static let caption2 = Typography(
        name: "Caption 2",
        size: 11,
        weight: .regular,
        lineHeight: 13,
        lineHeightMultiple: 0.82,
        tracking: 0.06
    )
    
    var font: UIFont {
        return UIFont.systemFont(ofSize: size, weight: weight)
    }
    
    var paragraphStyle: NSParagraphStyle {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        return paragraphStyle
    }
    
    func attributedString() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(
            string: "",
            attributes: [
                .baselineOffset: (lineHeight - size) / 2,
                .kern: tracking,
                .paragraphStyle: paragraphStyle
            ]
        )
        return attributedString
    }
}
