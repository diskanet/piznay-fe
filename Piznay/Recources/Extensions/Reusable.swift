//
//  Reusable.swift
//  Piznay
//
//  Created by Dima Kahanets on 15.11.2023.
//

import Foundation
import UIKit

protocol Reusable {

    static var reuseIdentifier: String { get }

}

extension Reusable {

    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
