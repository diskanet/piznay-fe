//
//  FirebaseService.swift
//  Piznay
//
//  Created by Dima Kahanets on 22.11.2023.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

class FirebaseService {
    
    static let shared = FirebaseService()
    static let databaseRef = Database.database(url: "https://piznay-9c1e3-default-rtdb.europe-west1.firebasedatabase.app").reference()
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
}
