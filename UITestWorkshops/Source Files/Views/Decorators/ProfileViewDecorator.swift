//
//  ProfileViewDecorator.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

struct ProfileViewDecorator: Decorator {
    
    typealias View = ProfileView
    
    func apply(to view: ProfileView) {
        
        view.backgroundColor = .white
        [view.emailTextField,
         view.passwordTextField,
         view.firstnameTextField,
         view.lastnameTextField,
         view.birthdateTextField,
         view.countryTextField]
            .forEach {
            $0.borderStyle = .none
            $0.backgroundColor = .white
            $0.textColor = .black
            $0.font = UIFont.systemFont(ofSize: 12, weight: UIFontWeightRegular)
            $0.isEnabled = false
        }
        
        view.passwordTextField.isSecureTextEntry = true
        
        view.avatarImageView.clipsToBounds = true
        view.avatarImageView.contentMode = .scaleAspectFill
        view.avatarImageView.image = #imageLiteral(resourceName: "placeholder.profile")
        
        view.avatarChangeButton.setTitle(.localized(key: "Profile.edit"), for: .normal)
        view.avatarChangeButton.backgroundColor = UIColor.gray.withAlphaComponent(0.75)
        
        view.countryTextField.elements = Constants.countriesList
        
        view.maleLabel.text = .localized(key: "Male")
        view.maleLabel.font = UIFont.systemFont(ofSize: 14)
        
        view.femaleLabel.text = .localized(key: "Female")
        view.femaleLabel.font = UIFont.systemFont(ofSize: 14)
        
        view.avatarChangeButton.isHidden = true
    }
    
    func applyEditMode(to view: ProfileView, on: Bool) {
        [view.passwordTextField,
        view.firstnameTextField,
        view.lastnameTextField,
        view.birthdateTextField,
        view.countryTextField].forEach {
            $0.isEnabled = on
            $0.borderStyle = on ? .roundedRect : .none
        }
        view.passwordTextField.isEnabled = on
        view.avatarChangeButton.isHidden = !on
        view.genderSwitch.isEnabled = on
    }
}
