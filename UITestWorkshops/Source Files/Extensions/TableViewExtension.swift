//
//  TableViewExtension.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

extension UITableView {
    
    /// Registers class
    ///
    /// - parameter aClass: type of UITableViewCell which conforms to Reusable protocol
    func registerClass<T: UITableViewCell>(_ aClass: T.Type) where T: Reusable {
        register(aClass, forCellReuseIdentifier: T.identifier)
    }
    
    /// Dequeues reusable cell
    ///
    /// - parameter aClass: type of UITableViewCell which conforms to Reusable protocol
    ///
    /// - returns: reusable cell with proper reuse identifier.
    ///            Used to acquire an already allocated cell, in lieu of allocating a new one.
    func dequeueReusableCell<T: UITableViewCell>(_ aClass: T.Type) -> T where T: Reusable {
        return (self.dequeueReusableCell(withIdentifier: T.identifier) as? T)!
    }
}

