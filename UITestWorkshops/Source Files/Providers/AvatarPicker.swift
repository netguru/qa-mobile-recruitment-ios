//
//  AvatarPicker.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

enum AvatarPickerError: Error {
    case avatarNotFounded, pickCanceled
}

final class AvatarPicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var onSuccess: (() -> Void)?
    var onError: ((Error) -> Void)?
    
    weak var delegate: AvatarPickerDelegate?
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
 
        guard let avatar = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            onError?(AvatarPickerError.avatarNotFounded)
            return
        }
        let name = String.random(characterAmount: 10)
        do {
            try avatar.save(with: name)
            
            delegate?.avatarProvider(self, didPickAvatar: AvatarPickerResult(name: name, image: avatar))
            onSuccess?()
        } catch let e {
            onError?(e)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        onError?(AvatarPickerError.pickCanceled)
    }
}
