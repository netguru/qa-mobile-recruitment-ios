//
//  OnboardingFlowController.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

final internal class OnboardingFlowController: FlowController {
    
    typealias ViewController = UINavigationController
    var onFinishOnBoarding: (() -> Void)?
    
    var rootViewController: UINavigationController = UINavigationController()
    
    init() {
        let onBoardingViewController: OnBoardingPageViewController = {
            let controller = OnBoardingPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
            controller.onFinishOnBoarding = {
                Settings.onBordingCompleted()
                self.rootViewController.dismiss(animated: true, completion: nil)
                self.onFinishOnBoarding?()
            }
            return controller
        }()
        rootViewController.setViewControllers([onBoardingViewController], animated: false)
    }
}
