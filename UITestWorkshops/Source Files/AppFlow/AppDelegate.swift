//
//  AppDelegate.swift
//  UITestWorkshops

import UIKit

@UIApplicationMain
fileprivate class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        Testable.isOn = true
        setupAppearance()
        let appController = AppController()

        guard let window = window else {
            fatalError("Window shoud be present here")
        }
        
        appController.presentRootController(inWindow: window)
        return true
    }
}

private extension AppDelegate {
    
    func setupAppearance() {
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = .yellow
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.backgroundColor = .green
    }
}

