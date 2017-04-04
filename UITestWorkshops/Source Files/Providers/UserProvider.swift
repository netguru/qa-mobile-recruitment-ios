//
//  UserProvider.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit
import RealmSwift

final class UserProvider {
    
    enum ConsistencyError: Error {
        case alreadyExists, doesNotExists
    }
    
    private var config = Realm.Configuration(
        schemaVersion: 3
    )
    
    func save(_ user: User) throws {
        let realm = try Realm(configuration: config)
    
        guard realm.object(ofType: User.self, forPrimaryKey: user.email) == nil else {
            throw ConsistencyError.alreadyExists
        }
        
        try realm.write {
            realm.add(user)
        }
    }
    
    func update(_ user: User) throws {
        let realm = try Realm(configuration: config)
        
        try realm.write {
            realm.add(user, update: true)
        }
    }
    
    func load(userWith email: String, and password: String) throws -> User {
        let realm = try Realm(configuration: config)
        
        guard let user = realm.object(ofType: User.self, forPrimaryKey: email),
              user.password == password
            else {
                throw ConsistencyError.doesNotExists
        }
        
        return user
    }
    
    func current() throws -> User {
        guard let loggedUserEmail = Settings.loggedUserEmail else { throw ConsistencyError.doesNotExists }
        
        let realm = try Realm(configuration: config)
        
        guard let user = realm.object(ofType: User.self, forPrimaryKey: loggedUserEmail)
            else {
                throw ConsistencyError.doesNotExists
        }
        
        return user
    }
}
