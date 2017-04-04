//
//  ItemCellLayout.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit
import PureLayout

internal struct ItemCellLayout: ViewLayout {
    
    typealias View = ItemCell
    
    func apply(to view: ItemCell) {
        
        view.favouriteButton.autoPinEdge(.trailing, to: .trailing, of: view.contentView, withOffset: -20)
        view.favouriteButton.autoAlignAxis(.horizontal, toSameAxisOf: view)
        view.favouriteButton.autoSetDimensions(to: CGSize(width: 64, height: 64))
        
        view.nameLabel.autoAlignAxis(.horizontal, toSameAxisOf: view)
        view.nameLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
    }
}
