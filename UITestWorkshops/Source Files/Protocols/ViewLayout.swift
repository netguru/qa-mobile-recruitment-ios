//
//  ViewLayout.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

/// Defines ViewLayout Protocol
protocol ViewLayout {
    
    /// View type to be arrange
    associatedtype View
    
    /// Defines ViewLayout method applicable to view
    ///
    /// - parameter view: view for arrange
    func apply(to view: View)
    
}
