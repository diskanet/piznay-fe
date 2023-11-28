//
//  UIButtonExtension.swift
//  Piznay
//
//  Created by Dima Kahanets on 19.11.2023.
//

import UIKit

extension UIButton {
    func addTarget(target: Any?, action: Selector) {
        self.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func setIcon(iconName: String, tintColor: UIColor) {
        self.setImage(UIImage(named: iconName)?.withTintColor(tintColor), for: .normal)
    }
}
