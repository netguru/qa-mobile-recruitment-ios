//
//  RegisterViewLayout.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit
import PureLayout

struct RegisterViewLayout:  ViewLayout {
    
    typealias View = RegisterView
    
    func apply(to view: RegisterView) {
        
        let margin = CGFloat(20.0)
        [view.emailTextField,
         view.passwordTextField,
         view.checkPasswordTextField,
         view.firstnameTextField,
         view.lastnameTextField,
         view.birthdateTextField,
         view.countryTextField]
            .forEach {
            $0.autoPinEdge(toSuperviewEdge: .leading, withInset: margin)
            $0.autoPinEdge(toSuperviewEdge: .trailing, withInset: margin)
            $0.autoSetDimension(.height, toSize: 36)
        }
        
        view.emailTextField.autoPinEdge(.top, to: .top, of: view, withOffset: 84)
        
        let fieldOffset = CGFloat(12.0)
        view.passwordTextField.autoPinEdge(.top, to: .bottom, of: view.emailTextField, withOffset: fieldOffset)
        view.checkPasswordTextField.autoPinEdge(.top, to: .bottom, of: view.passwordTextField, withOffset: fieldOffset)
        view.firstnameTextField.autoPinEdge(.top, to: .bottom, of: view.checkPasswordTextField, withOffset: fieldOffset)
        view.lastnameTextField.autoPinEdge(.top, to: .bottom, of: view.firstnameTextField, withOffset: fieldOffset)
        view.birthdateTextField.autoPinEdge(.top, to: .bottom, of: view.lastnameTextField, withOffset: fieldOffset)
        view.countryTextField.autoPinEdge(.top, to: .bottom, of: view.birthdateTextField, withOffset: fieldOffset)
        
        view.genderSwitch.autoAlignAxis(.vertical, toSameAxisOf: view)
        view.genderSwitch.autoPinEdge(.top, to: .bottom, of: view.countryTextField, withOffset: fieldOffset)
        
        view.maleLabel.autoAlignAxis(.horizontal, toSameAxisOf: view.genderSwitch)
        view.maleLabel.autoPinEdge(.trailing, to: .leading, of: view.genderSwitch, withOffset: -fieldOffset)
        
        view.femaleLabel.autoAlignAxis(.horizontal, toSameAxisOf: view.genderSwitch)
        view.femaleLabel.autoPinEdge(.leading, to: .trailing, of: view.genderSwitch, withOffset: fieldOffset)
        
        view.registerButton.autoSetDimensions(to: CGSize(width: 200, height: 44))
        view.registerButton.autoPinEdge(.top, to: .bottom, of: view.genderSwitch, withOffset: 20)
        view.registerButton.autoAlignAxis(toSuperviewAxis: .vertical)
    }
}
