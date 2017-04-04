//
//  AvatarPickerDelegate.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

protocol AvatarPickerDelegate: class {
    func avatarProvider(_ provider: AvatarPicker, didPickAvatar result: AvatarPickerResult)
}
