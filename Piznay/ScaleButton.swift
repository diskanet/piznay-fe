//
//  ScaleButton.swift
//  Piznay
//
//  Created by Dima Kahanets on 17.11.2023.
//

import Foundation
import UIKit

class ScaleButton: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            updateButtonAppearance()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyle() {
        let buttonSize: CGFloat = Sizes.s44
        
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.isUserInteractionEnabled = false
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        guard let imageView = self.imageView else { return }
        
        self.roundingCorners(radius: buttonSize / 2, curve: .circular, clip: true)
        self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
        self.insertSubview(blurEffectView, at: 0)
        self.bringSubviewToFront(imageView)

        
        self.snp.makeConstraints { make in
            make.size.equalTo(buttonSize)
        }
    }
    
    private func updateButtonAppearance() {
        let buttonColor = isHighlighted ? Colors.Base.white : UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
        self.backgroundColor = buttonColor
        self.tintColor = Colors.Base.black
    }
}

