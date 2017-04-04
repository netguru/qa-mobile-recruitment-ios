//
//  MainTabBarController.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    var onLogout: (() -> Void)? {
        didSet {
            profileController.onLogout = onLogout
        }
    }
    
    var onAvatarPick: (() -> Void)? {
        didSet {
            profileController.onAvatarPick = onAvatarPick
        }
    }
    
    fileprivate let itemsController = ItemsTableViewController()
    let profileController = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewControllers()
    }

}

private extension MainTabBarController {
    
    func setupViewControllers() {
        
        itemsController.tabBarItem.image = #imageLiteral(resourceName: "items")
        itemsController.tabBarItem.title = .localized(key: "List.title")
        
        let itemsNavigationController = UINavigationController()
        itemsNavigationController.viewControllers = [itemsController]
        
        
        profileController.tabBarItem.image = #imageLiteral(resourceName: "profile")
        profileController.tabBarItem.title = .localized(key: "Profile.title")
        
        let profileNavigationController = UINavigationController()
        profileNavigationController.viewControllers = [profileController]
        
        viewControllers = [itemsNavigationController, profileNavigationController]
    }
}
