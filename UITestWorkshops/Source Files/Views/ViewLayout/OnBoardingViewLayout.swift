//
//  OnBoardingViewLayout.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit
import PureLayout

internal struct OnBoardingViewLayout: ViewLayout {
    
    typealias View = OnBoardingView
    
    func apply(to view: OnBoardingView) {
        view.titleLabel.autoCenterInSuperview()
        
        view.finishButton.autoPinEdge(.top, to: .bottom, of: view.titleLabel)
        view.finishButton.autoAlignAxis(.vertical, toSameAxisOf: view)
    }
}
