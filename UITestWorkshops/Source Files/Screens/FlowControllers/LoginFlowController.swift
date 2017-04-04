//
//  LoginFlowController.swift
//  UITestWorkshops

import UIKit

final internal class LoginFlowController: NSObject, FlowController {
    typealias ViewController = UINavigationController

    var onSuccessLogin: (() -> Void)? {
        didSet {
            loginViewController.onSuccessLogin = onSuccessLogin
        }
    }
    
    private let loginViewController = LoginViewController()
    
    /// The root view controller of current flow
    var rootViewController: UINavigationController

    /// Initializes top up flow controller
    override init() {
        let navigationController = UINavigationController()
        rootViewController = navigationController
        super.init()
        
        navigationController.setViewControllers([loginViewController], animated: false)
        loginViewController.onRegisterButtonTap = {
            self.presentRegisterFrom()
        }
    }
    
    func presentRegisterFrom() {
        let registerViewController = RegisterViewController()
        registerViewController.onSuccessRegister = {
            self.rootViewController.dismiss(animated: true)
        }
        rootViewController.pushViewController(registerViewController, animated: true)
    }
}
