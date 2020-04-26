//
//  NotificationExtension.swift
//  CryptoDashboard
//
//  Created by Shai Ariman on 21/05/2019.
//  Copyright © 2019 Shai Ariman. All rights reserved.
//

import UIKit

public extension NSLayoutConstraint {
    func constraintWithMultiplier(_ multiplier: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self.firstItem!, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: multiplier, constant: self.constant)
    }
}
