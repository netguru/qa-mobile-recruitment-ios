//
//  PickerTextField.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit

final class PickerTextField: UITextField {

    fileprivate let elementPicker = UIPickerView()
    
    fileprivate let dateToolbar: UIToolbar = {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 44))
        let doneButton = UIBarButtonItem(title: .localized(key: "Done"), style: .done, target: self, action: #selector(doneButtonTapped))
        toolbar.items = [doneButton]
        return toolbar
    }()
    
    var elements = [String]()
    
    var selectedElement: String? = nil {
        didSet {
            text = selectedElement
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        elementPicker.delegate = self
        elementPicker.dataSource = self
        
        inputView = elementPicker
        inputAccessoryView = dateToolbar
    }
    
    @available(*, unavailable, message: "Please use init(frame)")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PickerTextField {
    dynamic func doneButtonTapped() {
        let currentIndex = elementPicker.selectedRow(inComponent: 0)
        selectedElement = elements[currentIndex]
        resignFirstResponder()
    }
}

extension PickerTextField: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return elements[row]
    }
}

extension PickerTextField: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return elements.count
    }
}
