//
//  DateExtensions.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

extension Date {
    /// Returns date in string in given format
    /// - parameter format: format for DateFormatter by default it's "dd/MM/yyyy".
    ///
    /// - returns: formated string.
    func string(in format: String = "dd/MM/yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
