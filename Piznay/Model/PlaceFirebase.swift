//
//  PlaceFirebase.swift
//  Piznay
//
//  Created by Dima Kahanets on 23.11.2023.
//

import Foundation

class PlaceFirebase: Codable {
    var id: String?
    var imageURL: String
    var imageRatio: Double
    var title: String
    var locality: String
    var country: String
    var latitude: String
    var longitude: String
    var originType: String
    var objectType: String
    var rating: Double = 0.0
//    var reviews: [ReviewFirebase] = []
    var reviewsCount: Int = 0
    var isVisited: Bool = false
//    var placesNearby: [PlaceFirebase] = []
    var phone: String?
    var website: String?
    var address: String
    var createdAt: Int?
    
    init(
        id: String? = nil,
        imageURL: String,
        imageRatio: Double,
        title: String,
        locality: String,
        country: String,
        latitude: String,
        longitude: String,
        originType: String,
        objectType: String,
//        rating: Double,
//        reviews: [ReviewFirebase],
//        reviewsCount: Int,
//        isVisited: Bool,
//        placesNearby: [PlaceFirebase],
        phone: String? = nil,
        website: String? = nil,
        address: String,
        createdAt: Int? = nil
    ) {
        self.id = id
        self.imageURL = imageURL
        self.imageRatio = imageRatio
        self.title = title
        self.locality = locality
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
        self.originType = originType
        self.objectType = objectType
//        self.rating = rating
//        self.reviews = reviews
//        self.reviewsCount = reviewsCount
//        self.isVisited = isVisited
//        self.placesNearby = placesNearby
        self.phone = phone
        self.website = website
        self.address = address
        self.createdAt = createdAt
    }
    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//
//        try container.encode(reviews, forKey: .reviews)
//        try container.encode(placesNearby, forKey: .placesNearby)
//    }
//
//    required init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//
//        reviews = try values.decode([ReviewFirebase].self, forKey: .reviews)
//        placesNearby = try values.decode([PlaceFirebase].self, forKey: .placesNearby)
//    }
}

extension PlaceFirebase {
    enum CodingKeys: String, CodingKey {
        case id,
             imageURL,
             imageRatio,
             title,
             locality,
             country,
             latitude,
             longitude,
             originType,
             objectType,
             rating,
//             reviews,
             reviewsCount,
             isVisited,
//             placesNearby,
             phone,
             website,
             address,
             createdAt
    }
}
