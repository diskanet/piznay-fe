//
//  User.swift
//  Piznay
//
//  Created by Dima Kahanets on 15.11.2023.
//

import Foundation
import RealmSwift

class User: Object {
    @Persisted(primaryKey: true) var id: ObjectId

}
