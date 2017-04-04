//
//  Reusable.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

protocol Reusable {
    
    /// Identifier for table view cell or collection view cell.
    static var identifier: String { get }
    
    /// Default height for cell
    static var defaultHeight: CGFloat { get }
    
    /// Default width for cell
    static var defaultWidth: CGFloat { get }
}

extension Reusable {
    
    static var identifier: String {
        return String(describing: type(of: self))
    }
    
    static var defaultHeight: CGFloat {
        return 44.0
    }
    
    static var defaultWidth: CGFloat {
        return 320.0
    }
}

