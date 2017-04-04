//
//  UITextFieldDecorator.swift
//  UITestWorkshops
//
//  Created by Piotr Torczynski on 07/02/2017.
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

final internal class UITextFieldDecorator: Decorator {

    typealias View = UITextField

    func apply(to view: UITextField) {
        view.borderStyle = .roundedRect
        view.backgroundColor = .white
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 12, weight: UIFontWeightRegular)
    }
}
