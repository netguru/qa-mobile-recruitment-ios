//
//  RegisterView.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

final internal class RegisterView: UIView {
    
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let checkPasswordTextField = UITextField()
    let firstnameTextField = UITextField()
    let lastnameTextField = UITextField()
    let birthdateTextField =  DateTextField()
    let countryTextField = PickerTextField()
    let genderSwitch = UISwitch()
    let maleLabel = UILabel()
    let femaleLabel = UILabel()
    let registerButton = UIButton(type: .system)

    private let viewLayout = RegisterViewLayout()
    private let decorator = RegisterViewDecorator()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(checkPasswordTextField)
        addSubview(firstnameTextField)
        addSubview(lastnameTextField)
        addSubview(birthdateTextField)
        addSubview(countryTextField)
        addSubview(genderSwitch)
        addSubview(maleLabel)
        addSubview(femaleLabel)
        addSubview(registerButton)
        
        viewLayout.apply(to: self)
        decorator.apply(to: self)
    }
    
    @available(*, unavailable, message: "Please use init(frame) instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
