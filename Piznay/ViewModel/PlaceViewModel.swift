//
//  PlaceViewModel.swift
//  Piznay
//
//  Created by Dima Kahanets on 15.11.2023.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage
import RxSwift
import RxCocoa

class PlaceViewModel {
    // MARK: Properties
    
    static let databaseRef = Database.database(url: "https://piznay-9c1e3-default-rtdb.europe-west1.firebasedatabase.app").reference()
    static let databasePath = "places"
    static let storageRef = Storage.storage(url: "gs://piznay-9c1e3.appspot.com").reference()
    
    
    
    func saveImageData(imageData: Data, completion: @escaping (Result<String, Error>) -> Void) {
        let imageRef = FirebaseService.storageRef.child("images/\(UUID().uuidString).jpg")
        imageRef.putData(imageData, metadata: nil) { (_, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                imageRef.downloadURL { (url, error) in
                    if let error = error {
                        completion(.failure(error))
                    } else if let downloadURL = url {
                        let imageURLString = downloadURL.absoluteString
                        completion(.success(imageURLString))
                    }
                }
            }
        }
    }
#warning("Learn about encode")
    static func createPlace(place: PlaceFirebase) {
        do {
            let jsonData = try JSONEncoder().encode(place)
            let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any]
            
            if var json = json {
                let newPlace = databaseRef.child(databasePath).childByAutoId()
                let id = newPlace.key
                let createdAt = ServerValue.timestamp()
                
                json["id"] = id
                json["createdAt"] = createdAt
//                json["reviews"] = []
//                json["placesNearby"] = []
                
                newPlace.setValue(json)
            }
        } catch {
            print("Error encoding place: \(error.localizedDescription)")
        }
    }
    
    #warning("Learn about decode")
    static func getPlaces(completion: @escaping ([PlaceFirebase]?, Error?) -> Void) {
        databaseRef.child(databasePath).observeSingleEvent(of: .value) { snapshot in
            guard let placesSnapshot = snapshot.children.allObjects as? [DataSnapshot] else {
                completion(nil, nil)
                return
            }
           
            print("Кількість об'єктів: \(placesSnapshot.count)")
          
            var places = [PlaceFirebase]()
            for placeSnapshot in placesSnapshot {
                print(placeSnapshot.value)
                if let placeDict = placeSnapshot.value as? [String: Any] {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: placeDict)
                        let decodedPlace = try JSONDecoder().decode(PlaceFirebase.self, from: jsonData)
                        places.append(decodedPlace)
                    } catch {
                        print("Error decoding place: \(error)")
                    }
                }
            }
            
            completion(places, nil)
        } withCancel: { error in
            completion(nil, error)
        }
    }
    
//    func createPlace(place: PlaceFirebase) {
//        let newPlace = FirebaseService.databaseRef.child("places").childByAutoId()
//        let timestamp = ServerValue.timestamp()
//        
//        newPlace.setValue([
//            "imageURL": place.imageURL,
//            "imageRatio": place.imageRatio,
//            "title": place.title,
//            "location": place.locality,
//            "country": place.country,
//            "details": [
//                "coordinates": [
//                    "latitude": place.latitude,
//                    "longitude": place.longitude
//                ]
//            ],
//            "origin": place.originType,
//            "object": place.objectType,
//            "rating": place.rating,
//            "reviews": place.reviews,
//            "reviewsCount": place.reviewsCount,
//            "isVisited": place.isVisited,
//            "placesNearby": place.placesNearby,
//            "contacts": [
//                "phone": place.phone,
//                "website": place.website,
//                "address": place.address,
//            ],
//            "creationDate": timestamp
//        ])
//    }
//   
    
    static func addPlace(place: Place) {
        RealmService.write(object: place)
    }
    
    
    static func saveReview(_ review: ReviewFirebase) {
           do {
               let jsonData = try JSONEncoder().encode(review)
               guard let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] else { return }
               // Збереження об'єкта review в базі даних
               let newReviewRef = databaseRef.child("reviews").childByAutoId()
               newReviewRef.setValue(json)
           } catch {
               print("Error encoding review: \(error.localizedDescription)")
           }
       }
       
       static func savePlace(_ place: PlaceFirebase) {
           do {
               let jsonData = try JSONEncoder().encode(place)
               guard let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] else { return }
               // Збереження об'єкта place в базі даних
               let newPlaceRef = databaseRef.child("places").childByAutoId()
               newPlaceRef.setValue(json)
           } catch {
               print("Error encoding place: \(error.localizedDescription)")
           }
       }
}



