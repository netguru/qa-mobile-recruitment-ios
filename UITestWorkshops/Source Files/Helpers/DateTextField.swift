//
//  DateTextField.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

final class DateTextField: UITextField {

    fileprivate let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        return picker
    }()
    
    fileprivate let dateToolbar: UIToolbar = {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 44))
        let doneButton = UIBarButtonItem(title: .localized(key: "Done"), style: .done, target: self, action: #selector(doneButtonTapped))
        toolbar.items = [doneButton]
        return toolbar
    }()
    
    var date: Date {
        return datePicker.date
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        inputView = datePicker
        inputAccessoryView = dateToolbar
    }
    
    @available(*, unavailable, message: "Please use init(frame) instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension DateTextField {
    dynamic func doneButtonTapped() {
        text = datePicker.date.string()
        resignFirstResponder()
    }
}
