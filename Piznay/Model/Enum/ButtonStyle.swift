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
    
    var highlightedColor: UIColor {
        switch self {
        case .filled:
            return Colors.Primary._700
        case .outlined:
            return UIColor.clear
        case .plain, .tinted:
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
    
    var hasBorder: Bool {
        self == .outlined
    }
}

