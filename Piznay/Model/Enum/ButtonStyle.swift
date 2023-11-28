//
//  ButtonStyle.swift
//  Piznay
//
//  Created by Dima Kahanets on 08.11.2023.
//

import Foundation
import UIKit

enum ButtonStyle {
    case filled
    case outlined
    case plain
    case tinted
    
    var backgroundColor: UIColor {
        switch self {
        case .filled:
            return Colors.Primary._600
        case .outlined, .plain:
            return UIColor.clear
        case .tinted:
            return Colors.Primary._100
        }
    }
    
    var highlightedBackgroundColor: UIColor {
        switch self {
        case .filled:
            return Colors.Primary._700
        case .outlined, .plain:
            return UIColor.clear
        case .tinted:
            return Colors.Primary._200
        }
    }
    
    var disabledBackgroundColor: UIColor {
        switch self {
        case .filled:
            return Colors.Neutral._950
        case .outlined, .plain:
            return UIColor.clear
        case .tinted:
            return Colors.Neutral._950
        }
    }
    
    var borderColor: CGColor {
        switch self {
        case .filled, .plain, .tinted:
            return UIColor.clear.cgColor
        case .outlined:
            return Colors.Primary._600.cgColor
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .filled:
            return Colors.Base.white
        case .outlined, .plain, .tinted:
            return Colors.Primary._600
        }
    }
    
    var disabledTextColor: UIColor {
        return Colors.Neutral._750
    }
    
    var highlightedTextColor: UIColor {
        switch self {
        case .filled:
            return Colors.Base.white
        case .outlined, .plain, .tinted:
            return Colors.Primary._700
        }
    }
    
    var hasBorder: Bool {
        self == .outlined
    }
}

enum ButtonSize {
    case large
    case medium
    case small
    
    var height: CGFloat {
        switch self {
        case .large:
            return Sizes.s44
        case .medium:
            return Sizes.s40
        case .small:
            return Sizes.s32
        }
    }
}

enum ButtonShape {
    case large
    case medium
    case small
    case rounding
    case sharp
    
    var corners: CGFloat {
            switch self {
            case .large, .medium:
                return Sizes.s12
            case .small:
                return Sizes.s8
            case .rounding:
                return Sizes.s56
            case .sharp:
                return 0
            }
        }
}

