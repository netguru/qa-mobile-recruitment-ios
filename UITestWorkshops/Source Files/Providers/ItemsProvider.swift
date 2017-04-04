//
//  ItemsProvider.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import Foundation
import RealmSwift

struct ItemsProvider {
    
    func add(_ item: Item, for user: User) throws {
        let realm = try Realm()
        
        try realm.write {
            user.items.append(item)
            realm.add(user, update: true)
        }
    }
    
    func remove(_ item: Item, for user: User) throws {
        let realm = try Realm()
        
        try realm.write {
            guard let index = user.items.index(of: item) else { return }
            user.items.remove(objectAtIndex: index)
            realm.add(user, update: true)
        }
    }
}
