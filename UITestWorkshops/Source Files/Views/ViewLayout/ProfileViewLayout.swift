//
//  ProfileViewLayout.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit
import PureLayout

struct ProfileViewLayout: ViewLayout {
    
    typealias View = ProfileView
    
    func apply(to view: ProfileView) {
        let margin = CGFloat(20.0)
        [view.emailTextField,
         view.passwordTextField,
         view.firstnameTextField,
         view.lastnameTextField,
         view.birthdateTextField,
         view.countryTextField]
            .forEach {
            $0.autoPinEdge(toSuperviewEdge: .leading, withInset: margin)
            $0.autoPinEdge(toSuperviewEdge: .trailing, withInset: margin)
            $0.autoSetDimension(.height, toSize: 36)
        }
        view.avatarImageView.autoMatch(.width, to: .width, of: view, withMultiplier: 0.25)
        view.avatarImageView.autoMatch(.height, to: .width, of: view.avatarImageView)
        view.avatarImageView.autoAlignAxis(toSuperviewAxis: .vertical)
        view.avatarChangeButton.autoMatch(.width, to: .width, of: view.avatarImageView)
        view.avatarChangeButton.autoMatch(.height, to: .height, of: view.avatarImageView)
        view.avatarChangeButton.autoAlignAxis(.horizontal, toSameAxisOf: view.avatarImageView)
        view.avatarChangeButton.autoAlignAxis(.vertical, toSameAxisOf: view.avatarImageView)
        
        let fieldOffset = CGFloat(2.0)
        view.avatarImageView.autoPinEdge(toSuperviewEdge: .top, withInset: 80)
        view.emailTextField.autoPinEdge(.top, to: .bottom, of: view.avatarImageView, withOffset: fieldOffset)
        view.passwordTextField.autoPinEdge(.top, to: .bottom, of: view.emailTextField, withOffset: fieldOffset)
        view.firstnameTextField.autoPinEdge(.top, to: .bottom, of: view.passwordTextField, withOffset: fieldOffset)
        view.lastnameTextField.autoPinEdge(.top, to: .bottom, of: view.firstnameTextField, withOffset: fieldOffset)
        view.birthdateTextField.autoPinEdge(.top, to: .bottom, of: view.lastnameTextField, withOffset: fieldOffset)
        view.countryTextField.autoPinEdge(.top, to: .bottom, of: view.birthdateTextField, withOffset: fieldOffset)
        
        let switchOffset = CGFloat(12.0)
        view.genderSwitch.autoAlignAxis(.vertical, toSameAxisOf: view)
        view.genderSwitch.autoPinEdge(.top, to: .bottom, of: view.countryTextField, withOffset: switchOffset)
        
        view.maleLabel.autoAlignAxis(.horizontal, toSameAxisOf: view.genderSwitch)
        view.maleLabel.autoPinEdge(.trailing, to: .leading, of: view.genderSwitch, withOffset: -switchOffset)
        
        view.femaleLabel.autoAlignAxis(.horizontal, toSameAxisOf: view.genderSwitch)
        view.femaleLabel.autoPinEdge(.leading, to: .trailing, of: view.genderSwitch, withOffset: switchOffset)
    }
}
