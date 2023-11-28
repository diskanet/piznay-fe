//
//  UIStackViewExtensions.swift
//  Piznay
//
//  Created by Dima Kahanets on 15.11.2023.
//

import UIKit

extension UIStackView {
    
    func configStackView(axis: NSLayoutConstraint.Axis, spacing: CGFloat, alignment: Alignment, distribution: Distribution) {
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
    }
   
}
