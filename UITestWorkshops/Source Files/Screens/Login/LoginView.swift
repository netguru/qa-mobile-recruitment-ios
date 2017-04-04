//
//  LoginView.swift
//  UITestWorkshops
//

import UIKit
import PureLayout

final internal class LoginView: BaseView {

    let loginViewLayout = LoginViewLayout()
    
    lazy var loginTextField = UITextField(frame: .zero)
    lazy var passwordTextField = UITextField(frame: .zero)
    lazy var loginButton = UIButton(frame: .zero)
    lazy var registerButton = UIButton(frame: .zero)
    
    var password: String? {
        return passwordTextField.text
    }
    
    var login: String? {
        return loginTextField.text
    }

    override func setupHierarchy() {
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(registerButton)
    }

    override func setupProperties() {
        backgroundColor = .white
        passwordTextField.isSecureTextEntry = true

        setupTextField(textField: loginTextField, withPlaceHolderText: .localized(key:"LoginView.email.placeholder"))
        setupTextField(textField: passwordTextField, withPlaceHolderText: .localized(key:"LoginView.password.placeholder"))

        let textFieldDecorator =  UITextFieldDecorator()
        textFieldDecorator.apply(to: loginTextField)
        textFieldDecorator.apply(to: passwordTextField)

        let buttonDecorator = UIButtonDecorator()
        buttonDecorator.apply(to: loginButton)
        loginButton.setTitle(.localized(key: "LoginView.loginButton.title"), for: .normal)
        loginButton.testableAccessibilityLabel(.localized(key: "LoginView.loginButton.title"))
        
        registerButton.setTitle(.localized(key: "LoginView.register.placeholder"), for: .normal)
        registerButton.testableAccessibilityLabel(.localized(key: "LoginView.register.placeholder"))
        buttonDecorator.apply(to: registerButton)
    }

    override func setupConstraints() {
        loginViewLayout.apply(to: self)
    }

    private func setupTextField(textField: UITextField, withPlaceHolderText text: String) {
        textField.placeholder = text
    }
}
