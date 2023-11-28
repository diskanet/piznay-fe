//
//  UITabBarControllerExtension.swift
//  Piznay
//
//  Created by Dima Kahanets on 15.11.2023.
//

import UIKit

extension UITabBar {
    func addTopBorder(color: UIColor, height: CGFloat) {
        let topBorder = CALayer()
        topBorder.backgroundColor = color.cgColor
        topBorder.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: height)
        self.layer.addSublayer(topBorder)
    }
}
