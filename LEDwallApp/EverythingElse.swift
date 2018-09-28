//
//  EverythingElse.swift
//  LEDwallApp
//
//  Created by Travis Brigman on 7/22/18.
//  Copyright © 2018 Travis Brigman. All rights reserved.
//

import Foundation


//if the canvas height is greater than 'x.5, then reduce it to 'x.5' and divide by tile height

func  wallDims(canvasHeightMeters: Double, canvasLengthMeters: Double) -> (wallHeight: Int, wallWidth: Int, doubleHarwdare: Int, singleHardware: Int, wallHeightInFeet: Double, wallWidthInFeet: Double, totalPanels: Int, wallAspectRatio: Double) {
    
    var doubleHardware = 0
    var singleHardware = 0
    var wallHeightInTiles = Measurement(value: 0.0, unit: UnitLength.halfMeters)
    var wallWidthInTiles = Measurement(value: 0.0, unit: UnitLength.halfMeters)
    
    if canvasHeightMeters.truncatingRemainder(dividingBy: 1.0) >= 0.5 {
        wallHeightInTiles.value = canvasHeightMeters.rounded(.towardZero) / (LEDpanel().panelHeight.value) + 1
    } else {
        wallHeightInTiles.value = canvasHeightMeters.rounded(.towardZero) / (LEDpanel().panelHeight.value)
    }
    if canvasLengthMeters.truncatingRemainder(dividingBy: 1.0) >= 0.5 {
        wallWidthInTiles.value = (canvasLengthMeters.rounded(.towardZero) / LEDpanel().panelWidth.value) + 1
    } else {
        wallWidthInTiles.value = canvasLengthMeters.rounded(.towardZero) / LEDpanel().panelWidth.value
    }
    
    let wallHardwareWidth = Int(wallWidthInTiles.value)
    
    if wallHardwareWidth / 2 % 2 == 0 {
        doubleHardware = wallHardwareWidth / 2
    } else {
        doubleHardware = wallHardwareWidth - 1
        singleHardware = 1
    }
    
    let wallHeightInFeet = wallHeightInTiles.converted(to: UnitLength.feet)
    let wallWidthInFeet = wallWidthInTiles.converted(to: UnitLength.feet)
    let totalPanels = Int(wallWidthInTiles.value) * Int(wallWidthInTiles.value)
    print("Total Number of Panels \(totalPanels)")
    
    let wallAspectRatio = Double(round(1000*((wallWidthInTiles.value / 2) / (wallHeightInTiles.value / 2)))/1000)
    print("Aspect Ratio\(wallAspectRatio)")
    
    switch wallAspectRatio {
    case 2.333:
        print("This is exactly a 21:9 wall!")
    case 1.778:
        print("this is exactly a 16:9 wall!")
    case 1.600:
        print("this is exactly a 16:10 wall!")
    case 1.888:
        print("this is exactly a 17:9 wall!")
    case 1.666:
        print("this is exactly a 5:3 wall!")
    case 1.5:
        print("this is exactly a 3:2 wall!")
    case 1.333:
        print("this is exactly a 4:3 wall!")
    case 1.25:
        print("this is exactly a 5:4 wall!")
    default:
        print("no exact display resolution found")
    }
    
    let wallAspectMinusColumn = Double(round(1000 * (((wallWidthInTiles.value / 2) - LEDpanel().panelWidth.value) / (wallHeightInTiles.value / 2))) / 1000)
    
    switch wallAspectMinusColumn {
    case 2.333:
        print("One less column and this would be exactly a 21:9 wall!")
    case 1.778:
        print("One less column and this would be exactly a 16:9 wall!")
    case 1.600:
        print("One less column and this would be exactly a 16:10 wall!")
    case 1.888:
        print("One less column and this would be exactly a 17:9 wall!")
    case 1.666:
        print("One less column and this would be exactly a 5:3 wall!")
    case 1.5:
        print("One less column and this would be exactly 3:2 wall!")
    case 1.333:
        print("One less column and this would be exactly 4:3 wall!")
    case 1.25:
        print("One less column and this would be exactly 5:4 wall!")
    default:
        print("subtracting a column doesn't help")
    }
    
    let wallAspectPlusColumn = Double(round(1000 * ((wallWidthInTiles.value / 2) + LEDpanel().panelWidth.value) / (wallHeightInTiles.value / 2)) / 1000)
    
    switch wallAspectPlusColumn {
    case 2.333:
        print("One more column and this would be exactly a 21:9 wall!")
    case 1.778:
        print("One more column and this would be exactly a 16:9 wall!")
    case 1.600:
        print("tOne more column and this would be exactly a 16:10 wall!")
    case 1.888:
        print("One more column and this would be exactly a 17:9 wall!")
    case 1.666:
        print("One more column and this would be exactly a 5:3 wall!")
    case 1.5:
        print("One more column and this would be exactly 3:2 wall!")
    case 1.333:
        print("One more column and this would be exactly 4:3 wall!")
    case 1.25:
        print("One more column and this would be exactly 5:4 wall!")
    default:
        print("adding a column doesn't help")
    }
    
    let wallAspectMinusRow = Double(round(1000 * ((wallWidthInTiles.value / 2) / ((wallHeightInTiles.value / 2) - LEDpanel().panelHeight.value))) / 1000)
    
    switch wallAspectMinusRow {
    case 2.333:
        print("One less row and this would be exactly a 21:9 wall!")
    case 1.778:
        print("One less row and this would be exactly a 16:9 wall!")
    case 1.600:
        print("One less row and this would be exactly a 16:10 wall!")
    case 1.888:
        print("One less row and this would be exactly a 17:9 wall!")
    case 1.666:
        print("One less row and this would be exactly a 5:3 wall!")
    case 1.5:
        print("One less row and this would be exactly 3:2 wall!")
    case 1.333:
        print("One less row and this would be exactly 4:3 wall!")
    case 1.25:
        print("One less row and this would be exactly 5:4 wall!")
    default:
        print("subtracting a row doesn't help")
    }
    
    let wallAspectplusRow = Double(round(1000 * (wallWidthInTiles.value / 2) / ((wallHeightInTiles.value / 2) + LEDpanel().panelHeight.value)) / 1000)
    
    switch wallAspectplusRow {
    case 2.333:
        print("One more row and this would be exactly a 21:9 wall!")
    case 1.778:
        print("One more row and this would be exactly a 16:9 wall!")
    case 1.600:
        print("One more row and this would be exactly a 16:10 wall!")
    case 1.888:
        print("One more row and this would be exactly a 17:9 wall!")
    case 1.666:
        print("One more row and this would be exactly a 5:3 wall!")
    case 1.5:
        print("One more row and this would be exactly 3:2 wall!")
    case 1.333:
        print("One more row and this would be exactly 4:3 wall!")
    case 1.25:
        print("One more row and this would be exactly 5:4 wall!")
    default:
        print("adding a row doesn't help")
    }
    
    
    return (wallHeight: Int(wallHeightInTiles.value), wallWidth: Int(wallWidthInTiles.value), doubleHardware, singleHardware, (round(1000*wallHeightInFeet.value)/1000), (round(1000*wallWidthInFeet.value)/1000),totalPanels, wallAspectRatio)
}





//let wallData = wallDims()
//let wallAspectRatio = Double(round(1000*((wallData.wallWidthInTiles.value / 2) / (wallHeightInTiles.Value / 2)))/1000)

//let wallAspectMinusColumn = Double(round(1000 * (((wallWidth / 2) - LEDpanel().panelWidth.value) / (wallData.wallHeight / 2))) / 1000)
//let wallAspectPlusColumn = Double(round(1000 * ((wallData.wallWidth / 2) + LEDpanel().panelWidth.value) / (wallData.wallHeight / 2)) / 1000)
//let wallAspectMinusRow = Double(round(1000 * ((wallData.wallWidth / 2) / ((wallData.wallHeight / 2) - LEDpanel().panelHeight.value))) / 1000)
//let wallAspectplusRow = Double(round(1000 * (wallData.wallWidth / 2) / ((wallData.wallHeight / 2) + LEDpanel().panelHeight.value)) / 1000)
