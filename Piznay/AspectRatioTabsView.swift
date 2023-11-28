//
//  CoverAspectControlsView.swift
//  Piznay
//
//  Created by Dima Kahanets on 19.11.2023.
//

import UIKit

class AspectRatioTabsView: UIView {
    
    private var squareButton: UIButton!
    private var landscapeButton: UIButton!
    private var portraitButton: UIButton!
    
    private var selectedButton: UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        squareButton = UIButton()
        squareButton.setIcon(iconName: "rating", tintColor: Colors.Neutral._150)
        
        landscapeButton = UIButton()

        portraitButton = UIButton()
        
        let stackView = UIStackView()
        stackView.configStackView(axis: .horizontal, spacing: 0, alignment: .fill, distribution: .fillEqually)
        self.addSubview(stackView)
    }
}
