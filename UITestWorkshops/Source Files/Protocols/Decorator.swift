//
//  Decorator.swift
//  UITestWorkshops
//
//  Created by Piotr Torczynski on 07/02/2017.
//  Copyright © 2017 Netguru. All rights reserved.
//

/// Defines decorator protocol
protocol Decorator {

    /// View type to be decorated
    associatedtype View

    /// Defines decoration method applicable to view
    ///
    /// - parameter view: View type to be decorated
    func apply(to view: View)
    
}
