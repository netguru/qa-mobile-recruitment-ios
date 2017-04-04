//
//  OnBoardingDecorator.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

internal struct OnBoardingDecorator: Decorator {
    
    typealias View = OnBoardingView
    
    func apply(to view: OnBoardingView) {
        view.titleLabel.font = .boldSystemFont(ofSize: 18)
        
        view.finishButton.setTitle(.localized(key: "OnBoardingView.finishButton"), for: .normal)
        view.finishButton.isHidden = true
    }
    
    func lastScreenState(view: OnBoardingView) {
        if let text = view.titleLabel.text {
            view.titleLabel.text = "\(text) last screen"
        }

        view.finishButton.isHidden = false
    }
}
