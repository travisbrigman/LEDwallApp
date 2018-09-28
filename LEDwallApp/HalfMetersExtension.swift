//
//  HalfMetersExtension.swift
//  LEDwallApp
//
//  Created by Travis Brigman on 7/22/18.
//  Copyright © 2018 Travis Brigman. All rights reserved.
//

import Foundation

extension UnitLength {
    static var halfMeters: UnitLength {
        
        return UnitLength(symbol: "halfMeters",
                          converter: UnitConverterLinear(coefficient: 0.5))
    }
}
