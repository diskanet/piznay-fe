//
//  UIViewExtension.swift
//  Piznay
//
//  Created by Dima Kahanets on 06.10.2023.
//

import UIKit

extension UIView {
    func addCardShadow() {
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.16).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 2
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.backgroundColor = UIColor.clear
    }
    
    func roundingCorners(radius: CGFloat, curve: CALayerCornerCurve, clip: Bool) {
        self.layer.cornerRadius = radius
        self.layer.cornerCurve = curve
        self.clipsToBounds = clip
    }
    
    func animateGeoCardView(withTranslation translationY: CGFloat) {
            UIView.animate(withDuration: 0.22) {
                self.transform = CGAffineTransform(translationX: 0, y: translationY)
            }
        }
}
