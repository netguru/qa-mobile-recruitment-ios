//
//  OnBoardingPageViewController.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

final internal class OnBoardingPageViewController: UIPageViewController {

    var onFinishOnBoarding: (() -> Void)?
    
    /// Number of screens in onboarding view
    let numberOfScreens = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        view.backgroundColor = .green
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showFirstCoupon()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension OnBoardingPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? OnBoardingViewController,
            vc.index > 0 else {
                return nil
        }
        return onBoardingViewController(at: vc.index - 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? OnBoardingViewController,
            vc.index < numberOfScreens - 1 else {
                return nil
        }
        return onBoardingViewController(at: vc.index + 1)
    }
   
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return numberOfScreens
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    private func onBoardingViewController(at index: Int) -> OnBoardingViewController {
        guard index >= 0 && index < numberOfScreens else{
            return OnBoardingViewController()
        }
        
        let controllerForReturn: OnBoardingViewController = {
            let controller = OnBoardingViewController()
            controller.onBoardingView.title = "Page \(index)"
            controller.onBoardingView.backgroundColor = .green
            
            controller.index = index
            if index == numberOfScreens - 1 {
                controller.whenIsThelastScreen()
            }
            
            controller.onFinishOnBoarding = onFinishOnBoarding
            
            return controller
        }()
        
        return controllerForReturn
    }
    
     func showFirstCoupon() {
        let firstView = onBoardingViewController(at: 0)
        setViewControllers([firstView], direction: .forward, animated: false, completion: nil)
    }
}
