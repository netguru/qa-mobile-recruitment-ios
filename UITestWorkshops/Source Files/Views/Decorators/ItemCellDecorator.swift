//
//  ItemCellDecorator.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

internal struct ItemCellDecorator: Decorator {
    
    typealias View = ItemCell
    
    func apply(to view: ItemCell) {
        
        view.nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        view.nameLabel.adjustsFontSizeToFitWidth = true
        
        view.favouriteButton.offState = UIImage(named: "star.off")
        view.favouriteButton.onState = UIImage(named: "star.on")
    }
}
