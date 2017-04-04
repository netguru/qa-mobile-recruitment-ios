//
//  RootFlowController.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

final internal class RootFlowController: FlowController {
    
    typealias ViewController = MainTabBarController
    
    /// RootViewController
    let rootViewController = MainTabBarController()
    
    /// Login flow
    let loginFlowController = LoginFlowController()
    
    /// OnBoarding flow
    let onboardingFlowController = OnboardingFlowController()
    
    /// Avatar flow
    let avatarFlowController = AvatarFlowController()
    
    init() {
        rootViewController.onLogout = {
            self.presentAuthorizationViewController()
        }
        
        rootViewController.onAvatarPick = {
            self.presentAvatarPicker()
        }
        
        loginFlowController.onSuccessLogin = {
            self.loginFlowController.rootViewController.dismiss(animated: true)
            self.rootViewController.selectedIndex = 0
        }
        
        avatarFlowController.avatarProvider.delegate = rootViewController.profileController
    }
    
    /// Presents LoginViewController
    func presentAuthorizationViewController(onSuccessLogin: (() -> Void)? = nil) {
        rootViewController.present(loginFlowController.rootViewController, animated: true)
    }
    /// Present OnBoardingViewController
    func presentOnBoardingViewController(onFinishOnBoarding: (() -> Void)? = nil) {
        rootViewController.present(onboardingFlowController.rootViewController, animated: true)
        onboardingFlowController.onFinishOnBoarding = onFinishOnBoarding
    }
    
    func dissmissOnBoarding() {
        onboardingFlowController.rootViewController.dismiss(animated: true)
    }
    
    func presentAvatarPicker() {
        rootViewController.present(avatarFlowController.rootViewController, animated: true)
    }
}
