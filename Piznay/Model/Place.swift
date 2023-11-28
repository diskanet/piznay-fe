//
//  Place.swift
//  Piznay
//
//  Created by Dima Kahanets on 15.11.2023.
//

import Foundation
import RealmSwift

class Place: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var coverURL: String?
    @Persisted var distance: Int64? = 0
    @Persisted var title: String
    @Persisted var location: String
    @Persisted var country: String
    @Persisted var latitude: Double
    @Persisted var longitude: Double
    @Persisted var originType: OriginType
    @Persisted var objectType: ObjectType
    @Persisted var rating: Double = 0.0
    @Persisted var reviews: List<Review>
    @Persisted var reviewsCount: Int64 = 0
    @Persisted var isVisited: Bool = false
    @Persisted var placesNearby: List<Place>
    @Persisted var phone: String?
    @Persisted var website: String?
    @Persisted var address: String
    
    var coordinates: String {
        return "\(latitude), \(longitude)"
    }
    
    convenience init(
        coverURL: String?,
        title: String,
        location: String,
        country: String,
        latitude: Double,
        longitude: Double,
        originType: OriginType,
        objectType: ObjectType,
        phone: String?,
        website: String?,
        address: String
    ) {
        self.init()
        self.coverURL = coverURL
        self.title = title
        self.location = location
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
        self.originType = originType
        self.objectType = objectType
        self.phone = phone
        self.website = website
        self.address = address
    }
}
