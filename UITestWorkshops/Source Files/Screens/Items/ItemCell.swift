//
//  ItemCell.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

final internal class ItemCell: UITableViewCell, Reusable {

    let nameLabel = UILabel()
    let favouriteButton = ToggleButton(animator: FadeToggleButtonAnimaton())
    
    let viewLayout = ItemCellLayout()
    let decorator = ItemCellDecorator()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel.testableAccessibilityLabel("nameLabel")
        favouriteButton.testableAccessibilityLabel("favouriteButton")
        
        contentView.addSubview(nameLabel)
        addSubview(favouriteButton)
        
        viewLayout.apply(to: self)
        decorator.apply(to: self)
    }
    
    @available(*, unavailable, message: "Please use init(style:, reuseIdentifier:) instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static var defaultHeight: CGFloat {
        return 240
    }
}
