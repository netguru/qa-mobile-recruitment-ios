//
//  LoginViewLayout.swift
//  UITestWorkshops
//
//  Created by Piotr Torczynski on 13/02/2017.
//  Copyright © 2017 Netguru. All rights reserved.
//

import Foundation
import PureLayout

internal struct LoginViewLayout: ViewLayout {

    typealias View = LoginView

    func apply(to view: LoginView) {
        [view.loginTextField, view.passwordTextField].forEach {
            $0.autoAlignAxis(toSuperviewAxis: .vertical)
            $0.autoPinEdge(toSuperviewEdge: .left, withInset: 16)
            $0.autoPinEdge(toSuperviewEdge: .right, withInset: 16)
            $0.autoSetDimension(.height, toSize: 36)
        }

        view.loginButton.autoAlignAxis(toSuperviewAxis: .vertical)
        view.loginButton.autoSetDimensions(to: CGSize(width: 200, height: 44))

        view.loginTextField.autoAlignAxis(.horizontal, toSameAxisOf: view, withOffset: -36)
        view.passwordTextField.autoPinEdge(.top, to: .bottom, of: view.loginTextField, withOffset: 12)
        view.loginButton.autoPinEdge(.top, to: .bottom, of: view.passwordTextField, withOffset: 48)
        
        view.registerButton.autoAlignAxis(toSuperviewAxis: .vertical)
        view.registerButton.autoSetDimensions(to: CGSize(width: 200, height: 44))
        view.registerButton.autoPinEdge(.top, to: .bottom, of: view.loginButton, withOffset: 8)
    }
}
