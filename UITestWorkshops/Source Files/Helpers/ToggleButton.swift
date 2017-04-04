//
//  ToggleButton.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

final class ToggleButton: UIButton {
    
    /// If you would want to add an extra action after .touchUpInside
    var onTap: (() -> Void)?
    var isOn = false {
        didSet{
            guard isOn != oldValue else { return }
            updateImageView(isOn)
        }
    }
    
    var offState: UIImage? {
        didSet{
            guard !isOn, offState != oldValue else { return }
            animator?.off(button: self as UIButton, with: offState)
        }
    }
    var onState: UIImage? {
        didSet{
            guard isOn, onState != oldValue else { return }
            animator?.on(button: self as UIButton, with: onState)
        }
    }
    var animator: ToggleButtonAnimation?
    
    init(animator: ToggleButtonAnimation) {
        super.init(frame: .zero)
        self.animator = animator
        addTarget(self, action: #selector(toggle), for: .touchUpInside)
    }
    
    @available(*, unavailable, message: "Please use init(animator: ) instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ToggleButton{
    
    func updateImageView(_ toggle: Bool) {
        let image = isOn ? onState : offState
        if isOn {
            animator?.on(button: self as UIButton, with: image)
        } else {
            animator?.off(button: self as UIButton, with: image)
        }
    }
    
    dynamic func toggle() {
        isOn = !isOn
        onTap?()
    }
}
