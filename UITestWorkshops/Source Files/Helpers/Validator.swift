//
//  Validator.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

struct Validator {
    
    private static let formatter = DateFormatter()
    
    static func isEmail(_ email: String) -> Bool {
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regEx)
        return predicate.evaluate(with: email)
    }
    
    static func isPassword(_ password: String) -> Bool {
        let regEx = "(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*(_|[^\\w])).{8,}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regEx)
        return predicate.evaluate(with: password)
    }
    
    static func hasOnlyLetters(_ string: String) -> Bool {
        let regEx = "[A-ź]{1,}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regEx)
        return predicate.evaluate(with: string)
    }
    
    static func isDate(_ string: String) -> Bool {
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.date(from: string) != nil
    }
}
