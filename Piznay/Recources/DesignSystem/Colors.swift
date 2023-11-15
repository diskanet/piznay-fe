//
//  ColorPalette.swift
//  Piznay
//
//  Created by Dima Kahanets on 07.10.2023.
//

import Foundation
import UIKit

struct Colors {
    
    struct Base {
        static let white = UIColor(hex: "#FFFFFF")
        static let black = UIColor(hex: "#000000")
    }
    
    struct Neutral {
        static let _150 = UIColor(hex: "#262626")
        static let _200 = UIColor(hex: "#333333")
        static let _300 = UIColor(hex: "#4D4D4D")
        static let _400 = UIColor(hex: "#666666")
        static let _500 = UIColor(hex: "#818181")
        static let _600 = UIColor(hex: "#999999")
        static let _750 = UIColor(hex: "#BFBFBF")
        static let _800 = UIColor(hex: "#CCCCCC")
        static let _850 = UIColor(hex: "#D9D9D9")
        static let _900 = UIColor(hex: "#E6E6E6")
        static let _950 = UIColor(hex: "#F2F2F2")
        static let _980 = UIColor(hex: "#FAFAFA")
    }
    
    struct Primary {
        static let _100 = UIColor(hex: "#F0F5FF")
        static let _200 = UIColor(hex: "#E3EBFF")
        static let _300 = UIColor(hex: "#BACDFF")
        static let _400 = UIColor(hex: "#91ABFF")
        static let _500 = UIColor(hex: "#6987FF")
        static let _600 = UIColor(hex: "#3D5BF2")
        static let _700 = UIColor(hex: "#293FCC")
        static let _800 = UIColor(hex: "#1927A6")
    }
    
    struct Red {
        static let _100 = UIColor(hex: "#FFF1F0")
        static let _200 = UIColor(hex: "#FFD9D6")
        static let _300 = UIColor(hex: "#FFB0AD")
        static let _400 = UIColor(hex: "#FF8585")
        static let _500 = UIColor(hex: "#FF5C61")
        static let _600 = UIColor(hex: "#F2303D")
        static let _700 = UIColor(hex: "#CC1F30")
        static let _800 = UIColor(hex: "#A61124")
    }
    
    struct Orange {
        static let _100 = UIColor(hex: "#FFF9F0")
        static let _200 = UIColor(hex: "#FFEDD6")
        static let _300 = UIColor(hex: "#FFD8AD")
        static let _400 = UIColor(hex: "#FFC085")
        static let _500 = UIColor(hex: "#FFA55C")
        static let _600 = UIColor(hex: "#FF8733")
        static let _700 = UIColor(hex: "#D96721")
        static let _800 = UIColor(hex: "#B34A12")
    }
    
    struct Yellow {
        static let _100 = UIColor(hex: "#FFFBE6")
        static let _200 = UIColor(hex: "#FFEDA3")
        static let _300 = UIColor(hex: "#FFE07A")
        static let _400 = UIColor(hex: "#FFD152")
        static let _500 = UIColor(hex: "#FFBF29")
        static let _600 = UIColor(hex: "#FFAA00")
        static let _700 = UIColor(hex: "#D98900")
        static let _800 = UIColor(hex: "#B36B00")
    }
    
    struct Green {
        static let _100 = UIColor(hex: "#E6F5E7")
        static let _200 = UIColor(hex: "#DAE8DC")
        static let _300 = UIColor(hex: "#C3DBC7")
        static let _400 = UIColor(hex: "#97CFA1")
        static let _500 = UIColor(hex: "#6EC281")
        static let _600 = UIColor(hex: "#49B463")
        static let _700 = UIColor(hex: "#338F4D")
        static let _800 = UIColor(hex: "#206937")
    }
    
    struct Lime {
        static let _100 = UIColor(hex: "#FAFFF0")
        static let _200 = UIColor(hex: "#F9FFF0")
        static let _300 = UIColor(hex: "#DFF2C7")
        static let _400 = UIColor(hex: "#C1E697")
        static let _500 = UIColor(hex: "#A3D96C")
        static let _600 = UIColor(hex: "#7EB350")
        static let _700 = UIColor(hex: "#5D8C38")
        static let _800 = UIColor(hex: "#3E6624")
    }
    
    struct Blue {
        static let _100 = UIColor(hex: "#F0FAFF")
        static let _200 = UIColor(hex: "#CFEEFF")
        static let _300 = UIColor(hex: "#A6DDFF")
        static let _400 = UIColor(hex: "#7DC9FF")
        static let _500 = UIColor(hex: "#52ADF7")
        static let _600 = UIColor(hex: "#278CEB")
        static let _700 = UIColor(hex: "#186BC4")
        static let _800 = UIColor(hex: "#0B4D9E")
    }
    
    struct Pink {
        static let _100 = UIColor(hex: "#FFF0F1")
        static let _200 = UIColor(hex: "#FFE3E6")
        static let _300 = UIColor(hex: "#FFBAC4")
        static let _400 = UIColor(hex: "#FF91A5")
        static let _500 = UIColor(hex: "#FF6989")
        static let _600 = UIColor(hex: "#FF4070")
        static let _700 = UIColor(hex: "#D92B5C")
        static let _800 = UIColor(hex: "#B31B4B")
    }
    
    struct Violet {
        static let _100 = UIColor(hex: "#F2DFF7")
        static let _200 = UIColor(hex: "#D7A2EB")
        static let _300 = UIColor(hex: "#BF76DE")
        static let _400 = UIColor(hex: "#A54DD1")
        static let _500 = UIColor(hex: "#8B29C4")
        static let _600 = UIColor(hex: "#7209B7")
        static let _700 = UIColor(hex: "#520091")
        static let _800 = UIColor(hex: "#39006B")
    }
    
    struct Turquoise {
        static let _100 = UIColor(hex: "#E6FFFF")
        static let _200 = UIColor(hex: "#A3FCFF")
        static let _300 = UIColor(hex: "#7AF6FF")
        static let _400 = UIColor(hex: "#4EE2F2")
        static let _500 = UIColor(hex: "#25CCE6")
        static let _600 = UIColor(hex: "#00B4D8")
        static let _700 = UIColor(hex: "#008FB3")
        static let _800 = UIColor(hex: "#006C8C")
    }
    
    struct Brown {
//            static let _100 = UIColor(hex: "#D1CAC5")
        static let _200 = UIColor(hex: "#D1CAC5")
        static let _300 = UIColor(hex: "#C4BDB9")
        static let _400 = UIColor(hex: "#B8A79C")
        static let _500 = UIColor(hex: "#AB8876")
        static let _600 = UIColor(hex: "#9D6B53")
        static let _700 = UIColor(hex: "#784B3A")
        static let _800 = UIColor(hex: "#522F23")
    }
}
