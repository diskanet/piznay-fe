//
//  PlaceViewModel.swift
//  Piznay
//
//  Created by Dima Kahanets on 15.11.2023.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

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
    
    static func saveReview(_ review: ReviewFirebase) {
           do {
               let jsonData = try JSONEncoder().encode(review)
               guard let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] else { return }
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
               let newPlaceRef = databaseRef.child("places").childByAutoId()
               newPlaceRef.setValue(json)
           } catch {
               print("Error encoding place: \(error.localizedDescription)")
           }
       }
}



