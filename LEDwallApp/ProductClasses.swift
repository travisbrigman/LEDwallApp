//
//  ProductClasses.swift
//  LEDwallApp
//
//  Created by Travis Brigman on 7/21/18.
//  Copyright © 2018 Travis Brigman. All rights reserved.
//

import Foundation
import UIKit

class Product {
    var manufacturer: String = ""
    var model: String = " "
    var cost: Double = 0.0
    var image: UIImage? = nil
    var weblink: String = " "
}

class LEDpanel : Product {
    var pixelPitch : Double = 0.0
    var pixelsPerPanel: Int = 0
    let panelHeight = Measurement(value: 0.5, unit: UnitLength.meters)
    let panelWidth = Measurement(value: 0.5, unit: UnitLength.meters)
    var maxWatts = Measurement(value: 0.0, unit: UnitPower.watts)
    var averageWatts = Measurement(value: 0.0, unit: UnitPower.watts)
    var weightInKilos = Measurement(value: 0.0, unit: UnitMass.kilograms)
}

class SendingCard : Product {
    var totalPixels: Int = 0
    var horizontalResolution: Int = 0
    var verticalResolution: Int = 0
    var dmxInput: Bool = false
    var genLock: Bool = false
}

class Hardware : Product {
    var weight = Measurement(value: 0.0, unit: UnitMass.kilograms)
    
}
