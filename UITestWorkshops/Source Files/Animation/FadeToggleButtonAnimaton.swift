//
//  FadeToggleButtonAnimaton.swift
//  UITestWorkshops
//
//  Created by Blazej Wdowikowski on 13/02/2017.
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

struct FadeToggleButtonAnimaton: ToggleButtonAnimation {
    
    private let animationDuration = 0.25
    private let options = UIViewAnimationOptions.beginFromCurrentState
    
    func on(button: UIButton, with image: UIImage?) {
        update(button: button, with: image)
    }
    
    func off(button: UIButton, with image: UIImage?) {
        update(button: button, with: image)
    }
    
    private func update(button: UIButton, with image: UIImage?) {
        UIView.animate(withDuration: animationDuration / 2, delay: 0, options: options, animations: {
            button.alpha = 0
        }, completion: { done in
            button.setImage(image, for: .normal)
            UIView.animate(withDuration: self.animationDuration / 2, delay: 0, options: self.options, animations: {
                button.alpha = 1
            }, completion: nil)
        })
    }
    
}
