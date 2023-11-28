//
//  PlaceObject.swift
//  Piznay
//
//  Created by Dima Kahanets on 07.10.2023.
//

import Foundation
import RealmSwift

enum ObjectType: String, CaseIterable, PersistableEnum {
        case bay = "Bay"
        case coralReef = "Coral reef"
        case canyon = "Canyon"
        case cliff = "Cliff"
        case cave = "Cave"
        case mountain = "Mountain"
        case river = "River"
        case waterfall = "Waterfall"
        case lake = "Lake"

        case castle = "Castle"
        case palace = "Palace"
        case fortress = "Fortress"
        case citadel = "Citadel"
}
