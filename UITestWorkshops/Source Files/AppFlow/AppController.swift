//
//  AppController.swift
//  UITestWorkshops
//
//  Created by Piotr Torczynski on 07/02/2017.
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

final class AppController {
    
    let rootFlowController = RootFlowController()

    func presentRootController(inWindow window: UIWindow) {
        set(window: window, withRootController: rootFlowController.rootViewController)
        
        guard let option = launchOptionsInProcessInfo else {
            standardFlow()
            return
        }
        
        testFlow(with: option)
    }

    private func set(window: UIWindow, withRootController rootController: UIViewController) {
        window.rootViewController = rootController
        window.makeKeyAndVisible()
    }
}

private extension AppController {
    
    func standardFlow() {
        
        if (UserDefaults.standard.integer(forKey: Constants.Keys.onBoardingVersion.rawValue) != Constants.currentOnBoardingVersion) {
            rootFlowController.presentOnBoardingViewController {
                self.rootFlowController.presentAuthorizationViewController()
                self.rootFlowController.dissmissOnBoarding()
            }
        } else if (!Settings.isUserLogged) {
            rootFlowController.presentAuthorizationViewController()
        }
    }
    
    func testFlow(with option: Constants.LaunchOptions) {
        switch option {
        case .onBoarding:
            rootFlowController.presentOnBoardingViewController {
                self.rootFlowController.presentAuthorizationViewController()
                self.rootFlowController.dissmissOnBoarding()
            }
        case .login:
            rootFlowController.presentAuthorizationViewController()
        case .items:
            break
        }
    }
    
    var launchOptionsInProcessInfo: Constants.LaunchOptions? {
        let arg = ProcessInfo.processInfo.arguments
        let onBoarding = Constants.LaunchOptions.onBoarding.rawValue
        let login = Constants.LaunchOptions.login.rawValue
        let items = Constants.LaunchOptions.items.rawValue
        
        /// NGRTodo: Ugly but I don't have better solution in mind right now
        if (arg.contains(onBoarding)) {
            return Constants.LaunchOptions.onBoarding
        } else if (arg.contains(login)) {
            return Constants.LaunchOptions.login
        } else if (arg.contains(items)) {
            return Constants.LaunchOptions.items
        } else {
            return nil
        }
    }
}
