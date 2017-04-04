//
//  OnBoardingView.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

final internal class OnBoardingView: BaseView {
    
    let viewLayout = OnBoardingViewLayout()
    let decorator = OnBoardingDecorator()
    
    let titleLabel = UILabel()
    let finishButton = UIButton()
    var title: String? {
        get {
            return titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }
    
    override func setupHierarchy() {
        addSubview(titleLabel)
        addSubview(finishButton)
    }
    
    override func setupConstraints() {
        viewLayout.apply(to: self)
        decorator.apply(to: self)
    }
}
