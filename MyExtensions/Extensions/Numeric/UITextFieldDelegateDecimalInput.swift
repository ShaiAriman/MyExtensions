//
//  UITextFieldDelegateDecimalInput.swift
//  CryptoDashboard
//
//  Created by Shai Ariman on 03/08/2019.
//  Copyright © 2019 Shai Ariman. All rights reserved.
//

import UIKit

public class UITextFieldDelegateDecimalInput : NSObject, UITextFieldDelegate {
    
    static let dotString = "."
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let countdots = textField.text?.components(separatedBy: UITextFieldDelegateDecimalInput.dotString).count {
            if countdots - 1 > 0 && string == UITextFieldDelegateDecimalInput.dotString
            { // Prevent adding more than one decimal point char
                return false
            }
        }
        return true
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        if let decimalTextField = textField as? UITextFieldDecimal {
            decimalTextField.formatCurrentValue()
        }
    }
}
