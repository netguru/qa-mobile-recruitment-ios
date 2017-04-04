//
//  UIButtonDecorator.swift
//  UITestWorkshops
//
//  Created by Piotr Torczynski on 07/02/2017.
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

final internal class UIButtonDecorator: Decorator {
    typealias View = UIButton

    func apply(to view: UIButton) {
        view.setTitleColor(.blue, for: .normal)
        view.layer.borderColor = UIColor.blue.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
    }
}
