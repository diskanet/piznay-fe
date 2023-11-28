//
//  RealmService.swift
//  Piznay
//
//  Created by Dima Kahanets on 17.11.2023.
//

import Foundation
import RealmSwift

class RealmService {
    private static var realmURL: URL {
        return Realm.Configuration.defaultConfiguration.fileURL!
    }
    
    private static var realmConfiguration: Realm.Configuration {
        return Realm.Configuration(
            fileURL: realmURL,
            schemaVersion: 2,
            migrationBlock: { migration, oldSchemaVersion in

            }
        )
    }
    
    private static var realm: Realm {
        do {
            return try Realm(configuration: realmConfiguration)
        } catch {
            fatalError("Failed to open Realm. Error: \(error.localizedDescription)")
        }
    }
    
    static func getRealmConfiguration() -> Realm.Configuration {
        return realmConfiguration
    }
}

extension RealmService {
    static func write<T: Object>(object: T, updatePolicy: Realm.UpdatePolicy = .modified) {
        do {
            try realm.write {
                realm.add(object, update: updatePolicy)
            }
        } catch {
            fatalError("Failed to write to Realm. Error: \(error.localizedDescription)")
        }
    }
    
    static func delete<T: Object>(object: T) {
        do {
            try realm.write {
                realm.delete(object)
            }
        } catch {
            fatalError("Failed to delete from Realm. Error: \(error.localizedDescription)")
        }
    }
    
    static func objects<T: Object>(type: T.Type) -> Results<T> {
        return realm.objects(type)
    }
}
