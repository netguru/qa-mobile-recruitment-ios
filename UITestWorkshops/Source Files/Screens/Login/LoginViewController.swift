//
//  LoginViewController.swift
//  UITestWorkshops
//
//  Created by Piotr Torczynski on 07/02/2017.
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

final internal class LoginViewController: UIViewController {

    var onSuccessLogin: (() -> Void)?
    var onRegisterButtonTap: (() -> Void)?

    let loginView = LoginView()

    override func loadView() {
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginView.registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        
        title = .localized(key: "LoginView.title")
    }

    dynamic func loginButtonTapped() {
        
        guard let email = loginView.login, Validator.isEmail(email) else {
            showError(message: .localized(key: "LoginView.email.wrong"))
            return
        }
        
        guard let password = loginView.password, Validator.isPassword(password) else {
            showError(message: .localized(key: "LoginView.password.wrong"))
            return
        }
        
        let manager = UserProvider()
        
        do {
            let user = try manager.load(userWith: email, and: password)
            
            Settings.loggedUserEmail = user.email
            
            onSuccessLogin?()
        } catch _ as UserProvider.ConsistencyError {
            showError(message: .localized(key:"RegisterView.user.donotexists"))
        } catch let e {
            showError(message: e.localizedDescription)
        }
        
    }
    
    dynamic func registerButtonTapped() {
        onRegisterButtonTap?()
    }
}

private extension LoginViewController {
    
    func showError(message: String) {
        let controller = UIAlertController(title: .localized(key: "Error"), message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "Ok", style: .default))
        present(controller, animated: true)
    }
}
