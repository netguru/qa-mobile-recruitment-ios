//
//  OnBoardingViewController.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

final internal class OnBoardingViewController: UIViewController, OnBoardable {

    var onFinishOnBoarding: (() -> Void)?
    let onBoardingView = OnBoardingView()
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        view = onBoardingView
    }
    
    func whenIsThelastScreen() {
        onBoardingView.decorator.lastScreenState(view: onBoardingView)
        onBoardingView.finishButton.addTarget(self, action: #selector(endOnBoarding), for: .touchUpInside)
    }
}

private extension OnBoardingViewController {
    
    dynamic func endOnBoarding() {
        onFinishOnBoarding?()
    }
}
