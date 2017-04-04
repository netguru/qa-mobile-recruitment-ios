//
//  ToggleButtonAnimation.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

protocol ToggleButtonAnimation {
    func on(button: UIButton, with image: UIImage?)
    func off(button: UIButton, with image: UIImage?)
}

