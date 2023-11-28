//
//  PlaceCardTVCViewModel.swift
//  Piznay
//
//  Created by Dima Kahanets on 03.11.2023.
//

import Foundation

class PlaceCardTVCViewModel {
    var title: String
    var location: String
    var rating: Double
    var reviewsCount: Int64
    var imageURL: URL?
    
    init(place: Place) {
        self.title = place.title
        self.location = "\(place.location ), \(place.country)"
        self.rating = place.rating
        self.reviewsCount = place.reviewsCount
        self.imageURL = makeImageURL(imageCode: place.coverURL ?? "")
    }
    
    private func makeImageURL(imageCode: String) -> URL? {
        URL(string: "\(FirebaseService.storageRef)\(imageCode)")
    }
}
