//
//  ReviewFirebase.swift
//  Piznay
//
//  Created by Dima Kahanets on 24.11.2023.
//

import Foundation

class ReviewFirebase: Codable {
    var owner: UserFirebase
    var publicationDate: String
    
    init(owner: UserFirebase, publicationDate: String) {
        self.owner = owner
        self.publicationDate = publicationDate
    }
}
