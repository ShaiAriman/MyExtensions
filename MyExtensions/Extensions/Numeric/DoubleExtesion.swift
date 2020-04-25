//
//  DoubleExtesion.swift
//  CryptoDashboard
//
//  Created by Shai Ariman on 08/11/2019.
//  Copyright © 2019 Shai Ariman. All rights reserved.
//

import Foundation

extension Double {
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
