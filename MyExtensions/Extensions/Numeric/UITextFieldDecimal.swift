//
//  UITextFieldDecimal.swift
//  CryptoDashboard
//
//  Created by Shai Ariman on 03/08/2019.
//  Copyright © 2019 Shai Ariman. All rights reserved.
//

import UIKit

public class UITextFieldDecimal : UITextField {
    
    static let comma = ","
    
//    private var inputFieldFormattingInfo = FieldFormattingInfo(currencyStringFormat: CurrencyStringFormat.Auto, postfix: "")
//    private let inputFieldFormattingInfoKeepingValueNumberOfDecimalPoints = FieldFormattingInfo(currencyStringFormat: CurrencyStringFormat.KeepValueNumberOfFractionDigits, postfix: "")
//
    private let textFieldDelegateDecimalInput = UITextFieldDelegateDecimalInput()
    
    override public func awakeFromNib() {
        self.delegate = textFieldDelegateDecimalInput
        self.keyboardType = .decimalPad
    }
    
    func getDoubleValue() -> Double? {
        if (self.hasText) {
            return Double.init(self.text!.replacingOccurrences(of: UITextFieldDecimal.comma, with: ""))
        }
        return nil
    }
    
    func setFormatted(value : Double, keepInputNumberOfDecimalPoints : Bool = false) {
        if keepInputNumberOfDecimalPoints {
//            self.text = inputFieldFormattingInfoKeepingValueNumberOfDecimalPoints.getFormattedValue(value: value)
        } else {
//            self.text = inputFieldFormattingInfo.getFormattedValue(value: value)
        }
    }
    
    func formatCurrentValue() {
        if let numericValue = getDoubleValue() {
            setFormatted(value: numericValue, keepInputNumberOfDecimalPoints: true)
        }
    }
    
//    func setCurrencyStringFormat(format : CurrencyStringFormat) {
//        inputFieldFormattingInfo.currencyStringFormat = format
//    }
}
