//
//  StringExtensions.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

extension String {
    
    static func localized(key: String, comment: String = "") -> String {
        return NSLocalizedString(key, comment: comment)
    }
    
    static func random(characterAmount: Int) -> String {
        
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
        
        var randomString = ""
        for _ in 0 ..< characterAmount {
            let rand = Int(arc4random() % UInt32(letters.characters.count))
            let nextCharIndex = letters.index(letters.startIndex, offsetBy: rand)
            let nextChart = letters[nextCharIndex]
            randomString = "\(randomString)\(nextChart)"
        }
        
        return randomString
    }
    
    func date(in format: String = "dd/MM/yyyy") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self)
    }
}
