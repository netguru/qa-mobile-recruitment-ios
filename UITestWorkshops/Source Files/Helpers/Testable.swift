//
//  Testable.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

struct Testable {
    
    private enum Keys: String {
        case isTestableOn
    }
    
    static var isOn: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.isTestableOn.rawValue)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.isTestableOn.rawValue)
        }
    }
}
