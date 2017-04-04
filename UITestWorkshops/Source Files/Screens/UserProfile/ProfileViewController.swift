//
//  ProfileViewController.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit
import RealmSwift

final internal class ProfileViewController: UIViewController {

    var onLogout: (() -> Void)?
    var onAvatarPick: (() -> Void)?

    fileprivate let userProvide = UserProvider()
    fileprivate var user: User?
    fileprivate var isEditable = false
    fileprivate let profileView = ProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupEditMode()
    }
    
    override func loadView() {
        view = profileView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUser()
        isEditable = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        editMode(is: false)
    }
}

private extension ProfileViewController {
    
    func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: .localized(key: "Profile.edit"), style: .plain, target: self, action: #selector(editButtonTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: .localized(key: "Profile.logout"), style: .plain, target: self, action: #selector(logoutButtonTapped))
    }
    
    func setupUser() {
        user = try? userProvide.current()
        refreshUserData()
    }
    
    func refreshUserData() {
        profileView.emailTextField.text = user?.email
        profileView.passwordTextField.text = user?.password
        profileView.firstnameTextField.text = user?.firstname
        profileView.lastnameTextField.text = user?.lastname
        profileView.birthdateTextField.text = user?.birthdate?.string()
        profileView.countryTextField.text = user?.country
        profileView.genderSwitch.isOn = user?.male ?? false
       
        let avatar: UIImage?
        if let avatarName = user?.avatar,
            avatarName != "" {
            avatar = try? UIImage.load(with: avatarName)
        } else {
            avatar = UIImage(named: "placeholder.profile")
        }
        profileView.avatarImageView.image = avatar
    }
    
    dynamic func editButtonTapped() {
        if isEditable {
            
            guard let password = profileView.passwordTextField.text, Validator.isPassword(password) else {
                showError(message: .localized(key: "RegisterView.password.wrong"))
                return
            }
            
            guard let firstname = profileView.firstnameTextField.text, Validator.hasOnlyLetters(firstname) else {
                showError(message: .localized(key: "RegisterView.firstname.wrong"))
                return
            }
            
            guard let lastname = profileView.lastnameTextField.text, Validator.hasOnlyLetters(lastname) else {
                showError(message: .localized(key: "RegisterView.lastname.wrong"))
                return
            }
            
            guard let birthdate = profileView.birthdateTextField.text, Validator.isDate(birthdate) else {
                showError(message: .localized(key: "RegisterView.birthdate.wrong"))
                return
            }
            
            guard let country = profileView.countryTextField.text, Validator.hasOnlyLetters(country) else {
                showError(message: .localized(key: "RegisterView.country.wrong"))
                return
            }
            
            do {
                let currentUser = try userProvide.current()
                let user = User()
                
                user.email = currentUser.email
                user.password = password
                user.items = currentUser.items
                user.avatar = currentUser.avatar
                user.firstname = firstname
                user.lastname = lastname
                user.birthdate = birthdate.date()
                user.country = country
                user.male = profileView.genderSwitch.isOn
                
                try userProvide.update(user)
                
                isEditable = !isEditable
                editMode(is: isEditable)
            } catch let e {
                showError(message: e.localizedDescription)
            }
            
        } else {
            isEditable = !isEditable
            editMode(is: isEditable)
        }
    }
    
    func editMode(is on: Bool) {
        navigationItem.leftBarButtonItem?.title = on ? .localized(key: "Profile.save") : .localized(key: "Profile.edit")
        profileView.decorator.applyEditMode(to: profileView, on: on)
    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: .localized(key: "Error"), message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
    
    dynamic func logoutButtonTapped() {
        Settings.loggedUserEmail = nil
        onLogout?()
    }
    
    func setupEditMode() {
        profileView.avatarChangeButton.addTarget(self, action: #selector(pickAvatar), for: .touchUpInside)
    }
    
    dynamic func pickAvatar() {
        onAvatarPick?()
    }
    
}

extension ProfileViewController: AvatarPickerDelegate {
    func avatarProvider(_ provider: AvatarPicker, didPickAvatar result: AvatarPickerResult) {
        do {
            let currentUser = try userProvide.current()
            let user = User()
            
            user.email = currentUser.email
            user.password = currentUser.password
            user.items = currentUser.items
            user.avatar = result.name
            user.firstname = currentUser.firstname
            user.lastname = currentUser.lastname
            user.birthdate = currentUser.birthdate
            user.country = currentUser.country
            user.male = currentUser.male
            
            try userProvide.update(user)
        } catch let e {
            showError(message: e.localizedDescription)
        }
    }
}

