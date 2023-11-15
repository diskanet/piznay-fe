//
//  PlaceObject.swift
//  Piznay
//
//  Created by Dima Kahanets on 07.10.2023.
//

import Foundation
import RealmSwift

enum ObjectType: String, PersistableEnum {
        case bay
        case coralReef
        case canyon
        case cliff
        case cave
        case mountain
        case river
        case waterfall
        case lake

        case castle
        case palace
        case fortress
        case citadel
}
