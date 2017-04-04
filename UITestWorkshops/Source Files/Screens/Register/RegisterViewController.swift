//
//  RegisterViewController.swift
//  UITestWorkshops
//
//  Created by Blazej Wdowikowski on 01/03/2017.
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

final internal class RegisterViewController: UIViewController {

    var onSuccessRegister: (() -> Void)?
    
    fileprivate let registerView = RegisterView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerView.registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        
        title = .localized(key: "RegisterView.title")
    }
    
    override func loadView() {
        view = registerView
    }

}

private extension RegisterViewController {
    
    dynamic func registerButtonTapped() {
        
        guard let email = registerView.emailTextField.text, Validator.isEmail(email) else {
            showError(message: .localized(key: "RegisterView.email.wrong"))
            return
        }
        
        guard let password = registerView.passwordTextField.text, Validator.isPassword(password) else {
            showError(message: .localized(key: "RegisterView.password.wrong"))
            return
        }
        
        guard let firstname = registerView.firstnameTextField.text, Validator.hasOnlyLetters(firstname) else {
            showError(message: .localized(key: "RegisterView.firstname.wrong"))
            return
        }
        
        guard let lastname = registerView.lastnameTextField.text, Validator.hasOnlyLetters(lastname) else {
            showError(message: .localized(key: "RegisterView.lastname.wrong"))
            return
        }
        
        guard let birthdate = registerView.birthdateTextField.text, Validator.isDate(birthdate) else {
            showError(message: .localized(key: "RegisterView.birthdate.wrong"))
            return
        }
        
        guard let country = registerView.countryTextField.text, Validator.hasOnlyLetters(country) else {
            showError(message: .localized(key: "RegisterView.country.wrong"))
            return
        }
        
        
        let user = User()
        user.email = email
        user.password = password
        user.firstname = firstname
        user.lastname = lastname
        user.birthdate = birthdate.date()
        user.country = country
        user.male = registerView.genderSwitch.isOn
        
        let manager = UserProvider()
        do {
            try manager.update(user)
            
            Settings.loggedUserEmail = user.email
            
            onSuccessRegister?()
        } catch _ as UserProvider.ConsistencyError {
            showError(message: .localized(key: "RegisterView.user.exists"))
        } catch let e {
            showError(message: e.localizedDescription)
        }
        
        
    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: .localized(key: "Error"), message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
}
