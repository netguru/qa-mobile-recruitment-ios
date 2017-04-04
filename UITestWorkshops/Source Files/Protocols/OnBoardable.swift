//
//  OnBoardable.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

protocol OnBoardable {
    
    var index: Int { get set }
    var onFinishOnBoarding: (() -> Void)? { get set }
    func whenIsThelastScreen()
    
}
