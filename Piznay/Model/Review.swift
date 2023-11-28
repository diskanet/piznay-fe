//
//  Review.swift
//  Piznay
//
//  Created by Dima Kahanets on 15.11.2023.
//

import Foundation
import RealmSwift

class Review: Object {
    @Persisted var owner: User?
    @Persisted var publicationDate: Date
    
    convenience init(owner: User, publicationDate: Date) {
        self.init()
        self.owner = owner
        self.publicationDate = publicationDate
    }
}
