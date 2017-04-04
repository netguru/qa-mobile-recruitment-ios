//
//  ProfileView.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

final internal class ProfileView: UIView {
    
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let avatarImageView = UIImageView()
    let avatarChangeButton = UIButton()
    let firstnameTextField = UITextField()
    let lastnameTextField = UITextField()
    let birthdateTextField =  DateTextField()
    let countryTextField = PickerTextField()
    let genderSwitch = UISwitch()
    let maleLabel = UILabel()
    let femaleLabel = UILabel()
    
    let viewLayout = ProfileViewLayout()
    let decorator = ProfileViewDecorator()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(avatarImageView)
        addSubview(avatarChangeButton)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(firstnameTextField)
        addSubview(lastnameTextField)
        addSubview(birthdateTextField)
        addSubview(countryTextField)
        addSubview(genderSwitch)
        addSubview(maleLabel)
        addSubview(femaleLabel)
        
        viewLayout.apply(to: self)
        decorator.apply(to: self)
    }
    
    @available(*, unavailable, message: "Please use init(frame:) instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
