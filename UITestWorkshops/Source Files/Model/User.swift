//
//  User.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit
import RealmSwift

final class User: Object {
    dynamic var email: String?
    dynamic var password: String?
    dynamic var avatar: String?
    dynamic var firstname: String?
    dynamic var lastname: String?
    dynamic var birthdate: Date?
    dynamic var country: String?
    dynamic var male = true
    var items = List<Item>()
    
    override class func primaryKey() -> String? {
        return "email"
    }
}
