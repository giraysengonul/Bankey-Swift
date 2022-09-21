//
//  DecimalUtils.swift
//  Bankey-Swift
//
//  Created by hakkı can şengönül on 22.09.2022.
//

import Foundation

extension Decimal{
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
