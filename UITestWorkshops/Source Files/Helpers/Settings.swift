//
//  Settings.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

struct Settings {
    
    static func onBordingNeeded() -> Bool {
        return UserDefaults.standard.integer(forKey: Constants.Keys.onBoardingVersion.rawValue) != Constants.currentOnBoardingVersion
    }
    
    static func onBordingCompleted() {
        UserDefaults.standard.set(Constants.currentOnBoardingVersion, forKey: Constants.Keys.onBoardingVersion.rawValue)
    }
    
    static var loggedUserEmail: String? {
        get {
            return UserDefaults.standard.string(forKey: Constants.Keys.loggedUserEmail.rawValue)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.Keys.loggedUserEmail.rawValue)
        }
    }
    
    static var isUserLogged: Bool {
        let email = UserDefaults.standard.string(forKey: Constants.Keys.loggedUserEmail.rawValue)
        return email != nil && email != ""
    }
}
