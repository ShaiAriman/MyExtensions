//
//  RoundedCornersExtension.swift
//  WToDo
//
//  Created by Shai Ariman on 23/06/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var dropShadow : Bool {
        get {
            return layer.shadowOpacity > 0
        }
        set {
            if newValue {
                if layer.shadowPath == nil {
                    layer.masksToBounds = false
                    layer.shadowColor = UIColor.black.cgColor
                    layer.shadowOpacity = 0.15
                    layer.shadowOffset = CGSize(width: 1, height: 2)
                    layer.shadowRadius = 2
                    layer.shadowPath = UIBezierPath(rect: bounds).cgPath
                    layer.shouldRasterize = true
                    layer.rasterizationScale = UIScreen.main.scale
                } else {
                    layer.shadowOpacity = 0.15
                }
            } else {
                layer.shadowOpacity = 0
            }
        }
    }
    
    @objc func animateOnTap() {
        UIView.animate(withDuration: 0.04, animations: {
            self.transform = CGAffineTransform(scaleX: 0.94, y: 0.94)
            self.alpha = 0.95
        } , completion: { finished in
            UIView.animate(withDuration: 0.04, animations: {
                self.transform = CGAffineTransform.identity
                self.alpha = 1
            }, completion: nil)
        })
    }
    
    func animateLabelOnValueChanged() {
        UIView.animate(withDuration: 0.5, animations: {
            self.transform = CGAffineTransform(scaleX: 1.065, y: 1.065)
            } , completion:  { finished in
                UIView.animate(withDuration: 0.5, animations: {
                    self.transform = CGAffineTransform.identity
                    }, completion: nil)
        })
    }
}
