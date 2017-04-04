//
//  AvatarFlowController.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit
import AVFoundation
import Photos

final class AvatarFlowController: FlowController {
    
    typealias ViewController = UIAlertController
    var rootViewController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    
    
    fileprivate let avatarPickerController = UIImagePickerController()
    let avatarProvider = AvatarPicker()
    
    init() {
        setupRootController()
        setupAvatarPicker()
    }
    
    func presentError(for type: UIImagePickerControllerSourceType) {
        let message: String = {
            switch type {
            case .camera:
                return String.localized(key: "Avatar.camera.access")
            default:
                return String.localized(key: "Avatar.library.access")
            }
        }()
        
        let alert = UIAlertController(title: .localized(key: "Error"), message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: .localized(key: "Ok"), style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: .localized(key: "Settings"), style: .default, handler: { alert in
            guard let settingsURL = URL(string: UIApplicationOpenSettingsURLString) else { return }
            UIApplication.shared.openURL(settingsURL)
        }))
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true)
    }
    
    func presentPicker(for type: UIImagePickerControllerSourceType) {
        
        avatarPickerController.delegate = avatarProvider
        avatarPickerController.sourceType = type
        
        UIApplication.shared.keyWindow?.rootViewController?.present(avatarPickerController, animated: true)
    }
}

fileprivate extension AvatarFlowController {
    
    func setupRootController() {
        rootViewController.addAction(UIAlertAction(title: .localized(key: "Avatar.camera.title"), style: .default, handler: { _ in
            let type = AVMediaTypeVideo
            let status = AVCaptureDevice.authorizationStatus(forMediaType: type)
            let source = UIImagePickerControllerSourceType.camera
            
            switch status {
            case .denied: self.presentError(for: source)
            case .authorized: self.presentPicker(for: source)
            case .restricted: self.presentError(for: source)
            case .notDetermined:
                AVCaptureDevice.requestAccess(forMediaType: type) { granted in
                    if granted {
                        self.presentPicker(for: source)
                    } else {
                        self.presentError(for: source)
                    }
                }
            }
            
        }))
        rootViewController.addAction(UIAlertAction(title: .localized(key: "Avatar.library.title"), style: .default, handler: { _ in
            let status  = PHPhotoLibrary.authorizationStatus()
            let source = UIImagePickerControllerSourceType.savedPhotosAlbum
            
            switch status {
            case .denied: self.presentError(for: source)
            case .authorized: self.presentPicker(for: source)
            case .restricted: self.presentError(for: source)
            case .notDetermined:
                PHPhotoLibrary.requestAuthorization() { status in
                    guard status == .authorized else {
                        self.presentError(for: source)
                        return
                    }
                    self.presentPicker(for: source)
                }
            }
        }))
        rootViewController.addAction(UIAlertAction(title: .localized(key: "Cancel"), style: .cancel, handler: nil))
    }
    
    func setupAvatarPicker() {
        
        avatarProvider.onSuccess = { [weak self] in
            self?.avatarPickerController.dismiss(animated: true, completion: nil)
        }
        
        avatarProvider.onError = { error in
            let alert = UIAlertController(title: .localized(key: "Error"), message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: .localized(key: "Ok"), style: .cancel, handler: nil))
            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true)
        }
    }
}

