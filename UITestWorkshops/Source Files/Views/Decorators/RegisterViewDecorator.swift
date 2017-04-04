//
//  RegisterViewDecorator.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

struct RegisterViewDecorator: Decorator {
    
    typealias View = RegisterView
    
    func apply(to view: RegisterView) {
        view.backgroundColor = .white
        
        let textFieldDecorator = UITextFieldDecorator()
        
        textFieldDecorator.apply(to: view.emailTextField)
        textFieldDecorator.apply(to: view.passwordTextField)
        textFieldDecorator.apply(to: view.checkPasswordTextField)
        textFieldDecorator.apply(to: view.firstnameTextField)
        textFieldDecorator.apply(to: view.lastnameTextField)
        textFieldDecorator.apply(to: view.birthdateTextField)
        textFieldDecorator.apply(to: view.countryTextField)
        
        view.emailTextField.placeholder = .localized(key: "RegisterView.email.placeholder")
        
        view.passwordTextField.placeholder = .localized(key: "RegisterView.password.placeholder")
        view.passwordTextField.isSecureTextEntry = true
        
        view.checkPasswordTextField.placeholder = .localized(key: "RegisterView.password.retype.placeholder")
        view.checkPasswordTextField.isSecureTextEntry = true
        
        view.firstnameTextField.placeholder = .localized(key: "RegisterView.firstname.placeholder")
        
        view.lastnameTextField.placeholder = .localized(key: "RegisterView.lastname.placeholder")
        
        view.birthdateTextField.placeholder = .localized(key: "RegisterView.birthdate.placeholder")
        
        view.countryTextField.placeholder = .localized(key: "RegisterView.country.placeholder")
        view.countryTextField.elements = Constants.countriesList
        
        view.maleLabel.text = .localized(key: "Male")
        view.maleLabel.font = UIFont.systemFont(ofSize: 14)
        
        view.femaleLabel.text = .localized(key: "Female")
        view.femaleLabel.font = UIFont.systemFont(ofSize: 14)
        
        let buttonDecorator = UIButtonDecorator()
        view.registerButton.setTitle(.localized(key: "LoginView.register.placeholder"), for: .normal)
        buttonDecorator.apply(to: view.registerButton)
    }
}
