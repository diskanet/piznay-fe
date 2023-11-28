//
//  ModalCloseButton.swift
//  Piznay
//
//  Created by Dima Kahanets on 15.11.2023.
//

import UIKit
import SnapKit

class LeftNavButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyle() {
        let buttonSize: CGFloat = Sizes.s32
        
        self.tintColor = Colors.Neutral._150
        self.layer.borderWidth = 0.5
        self.layer.borderColor = Colors.Neutral._900.cgColor
        self.backgroundColor = Colors.Base.white
        self.roundingCorners(radius: buttonSize / 2, curve: .circular, clip: true)
        
        self.snp.makeConstraints { make in
            make.size.equalTo(buttonSize)
        }
    }
    
    func setIcon(iconName: String) {
        let config = UIImage.SymbolConfiguration(pointSize: 15, weight: .medium)
        self.setImage(UIImage(systemName: iconName, withConfiguration: config), for: .normal)
    }
}
