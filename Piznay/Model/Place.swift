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
    @Persisted var coverURL: LinkingObjects<Place>
    @Persisted var distance: Int
    @Persisted var title: String
    @Persisted var location: String
    @Persisted var country: String
    @Persisted var details: Map<String, String>
    @Persisted var coordinates: Coordinates
    @Persisted var originType: OriginType
    @Persisted var objectType: ObjectType
    @Persisted var rating: Double
    @Persisted var reviews: List<Review>
    @Persisted var reviewsCount: Int
    @Persisted var isVisited: Bool
    @Persisted var placesNearby: List<Place>
    @Persisted var phone: String?
    @Persisted var website: String?
    @Persisted var address: String
    
    convenience init(
        coverURL: LinkingObjects<Place>,
        distance: Int,
        title: String,
        location: String,
        country: String,
        details: Map<String, String>,
        coordinates: Coordinates,
        originType: OriginType,
        objectType: ObjectType,
        rating: Double,
        reviews: List<Review>,
        reviewsCount: Int,
        isVisited: Bool = false,
        placesNearby: List<Place>,
        phone: String?,
        website: String?,
        address: String
    ) {
        self.init()
        self.coverURL = coverURL
        self.distance = distance
        self.title = title
        self.location = location
        self.country = country
        self.details = details
        self.coordinates = coordinates
        self.originType = originType
        self.objectType = objectType
        self.rating = rating
        self.reviews = reviews
        self.reviewsCount = reviewsCount
        self.isVisited = isVisited
        self.placesNearby = placesNearby
        self.phone = phone
        self.website = website
        self.address = address
    }
}
