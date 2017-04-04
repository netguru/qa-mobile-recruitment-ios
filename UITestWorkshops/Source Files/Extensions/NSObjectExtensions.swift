//
//  NSObjectExtensions.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

extension NSObject {

    /// Set new value based on Testable.isOn
    func testableAccessibilityLabel(_ label: String) {
        accessibilityLabel = Testable.isOn ? label : accessibilityLabel
    }
}
