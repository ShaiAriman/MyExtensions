//
//  UILabelExtension.swift
//  CryptoDashboard
//
//  Created by Shai Ariman on 01/09/2019.
//  Copyright © 2019 Shai Ariman. All rights reserved.
//

import UIKit

public extension UILabel {

    static let AppFontName = "Helvetica Neue"
    
    @IBInspectable
    var AppFont : String { // AppFontType rawValue
        get {
            return ""  // no need for a getter at this point
        }
        set {
            switch newValue {
            case AppFontType.NumberValueExtraSmall.rawValue:
                self.font = UIFont(name: UILabel.AppFontName, size: 13)
                self.font = UIFontMetrics(forTextStyle: .footnote).scaledFont(for: self.font)
                self.adjustsFontForContentSizeCategory = true
            case AppFontType.NumberValueSmall.rawValue:
                self.font = UIFont(name: UILabel.AppFontName, size: 14.5)
                self.font = UIFontMetrics(forTextStyle: .subheadline).scaledFont(for: self.font)
                self.adjustsFontForContentSizeCategory = true
            case AppFontType.NumberValueMedium.rawValue:
                self.font = UIFont(name: UILabel.AppFontName, size: 16)
                self.font = UIFontMetrics(forTextStyle: .callout).scaledFont(for: self.font)
                self.adjustsFontForContentSizeCategory = true
            case AppFontType.NumberValueLarge.rawValue:
                self.font = UIFont(name: UILabel.AppFontName, size: 27)
                self.font = UIFontMetrics(forTextStyle: .title1).scaledFont(for: self.font)
                self.adjustsFontForContentSizeCategory = true
            case AppFontType.TextExtraSmall.rawValue:
                self.font = UIFont(name: UILabel.AppFontName, size: 12)
                self.font = UIFontMetrics(forTextStyle: .caption1).scaledFont(for: self.font)
                self.adjustsFontForContentSizeCategory = true
            case AppFontType.TextSmall.rawValue:
                self.font = UIFont(name: UILabel.AppFontName, size: 14.5)
                self.font = UIFontMetrics(forTextStyle: .footnote).scaledFont(for: self.font)
                self.adjustsFontForContentSizeCategory = true
            case AppFontType.TextMedium.rawValue:
                self.font = UIFont(name: UILabel.AppFontName, size: 15)
                self.font = UIFontMetrics(forTextStyle: .subheadline).scaledFont(for: self.font)
                self.adjustsFontForContentSizeCategory = true
            case AppFontType.TextLarge.rawValue:
                self.font = UIFont(name: UILabel.AppFontName, size: 32)
                self.font = UIFontMetrics(forTextStyle: .title2).scaledFont(for: self.font)
                self.adjustsFontForContentSizeCategory = true
            default:
                break
            }
        }
    }
    
    enum AppFontType : String {
        case NumberValueExtraSmall = "NumberValueExtraSmall"
        case NumberValueSmall = "NumberValueSmall"
        case NumberValueMedium = "NumberValueMedium"
        case NumberValueLarge = "NumberValueLarge"
        case TextExtraSmall = "TextExtraSmall"
        case TextSmall = "TextSmall"
        case TextMedium = "TextMedium"
        case TextLarge = "TextLarge"
    }
}
