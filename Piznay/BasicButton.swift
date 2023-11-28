//
//  BasicButton.swift
//  Piznay
//
//  Created by Dima Kahanets on 08.11.2023.
//

import Foundation
import UIKit
import SnapKit

class BasicButton: UIButton {
    
    private var style: ButtonStyle = .filled {
        didSet {
            applyStyle()
        }
    }
    
    private var size: ButtonSize = .large {
        didSet {
            applyStyle()
        }
    }
    
    private var shape: ButtonShape = .large {
        didSet {
            applyStyle()
        }
    }
    
    private var buttonIcon: UIImage? {
        didSet {
            setButtonIcon()
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            applyStyle()
            setEnabled()
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            applyStyle()
            setHighlighted()
        }
    }
    
    init(
        style: ButtonStyle = .filled,
        size: ButtonSize = .large,
        shape: ButtonShape = .large
    ) {
        super.init(frame: .zero)
        self.style = style
        self.size = size
        self.shape = shape
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup() {
        let buttonHeight: CGFloat = size.height
        
        titleLabel?.font = Typography.body.font
        layer.cornerRadius = shape.corners
        layer.cornerCurve = .continuous
        
        self.snp.makeConstraints { make in
            make.height.equalTo(buttonHeight)
        }
    }
    
    func applyStyle() {
        setTitleColor(style.textColor, for: .normal)
        setTitleColor(style.disabledTextColor, for: .disabled)
        backgroundColor = isEnabled ? style.backgroundColor : style.disabledBackgroundColor
        layer.borderWidth = isEnabled && style.hasBorder ? 1.2 : 0
        layer.borderColor = style.borderColor
    }
    
    func setEnabled() {
        layer.borderWidth = isEnabled && style.hasBorder ? 1.2 : 0
        backgroundColor = isEnabled ? style.backgroundColor : style.disabledBackgroundColor
    }
    
    func setHighlighted() {
        layer.borderWidth = isEnabled && style.hasBorder ? 1.2 : 0
        backgroundColor = isHighlighted ? style.highlightedBackgroundColor : style.backgroundColor
        tintColor = isHighlighted ? style.highlightedTextColor : style.textColor
    }
    
    func setButtonIcon() {
        setImage(buttonIcon?.withTintColor(Colors.Primary._600), for: .normal)
        setImage(buttonIcon?.withTintColor(Colors.Primary._700), for: .highlighted)
        setImage(buttonIcon?.withTintColor(Colors.Neutral._750), for: .disabled)
    }
    
    func setButtonStyle(to newStyle: ButtonStyle) {
        style = newStyle
    }
}
