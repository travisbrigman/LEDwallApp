//
//  ViewController.swift
//  LEDwallApp
//
//  Created by Travis Brigman on 7/19/18.
//  Copyright © 2018 Travis Brigman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var canvasWidth: UITextField!
    @IBOutlet weak var canvasHeight: UITextField!
    
    @IBAction func conversionSwitch(_ sender: UISwitch) {
        if !sender.isOn {
            CanvasHeightUnitLabel.text = "Meters"
            CanvasWidthUnitLabel.text = "Meters"
        } else if sender.isOn {
            CanvasHeightUnitLabel.text = "Feet"
            CanvasWidthUnitLabel.text = "Feet"
        }

    }
    @IBOutlet weak var isSwitchOn: UISwitch!
    
    
    @IBOutlet weak var CanvasWidthUnitLabel: UILabel!
    
    @IBOutlet weak var CanvasHeightUnitLabel: UILabel!
    
    func standardToMetric() -> (Measurement<UnitLength>, Measurement<UnitLength>) {
        let canvasHeightDouble = Measurement(value: Double(canvasHeight.text!)!, unit: UnitLength.feet)
        let canvasWidthDouble = Measurement(value: Double(canvasWidth.text!)!, unit: UnitLength.feet)
        
        print("canvasHeight = \(canvasHeightDouble) canvasWidth = \(canvasWidthDouble)")
        
        let canvasHeightConverted = canvasHeightDouble.converted(to: UnitLength.meters)
        let canvasWidthConverted = canvasWidthDouble.converted(to: UnitLength.meters)
        
        print("Converted Height = \(canvasHeightConverted) Converted Width = \(canvasWidthConverted)")
        
        return (canvasHeightConverted, canvasWidthConverted)
    }

    @IBAction func Calculate(_ sender: UIButton) {
        
        let converted = standardToMetric()
        
        var height = Double(canvasWidth.text!)!
        var width = Double(canvasWidth.text!)!
        
        if isSwitchOn.isOn {
            height = converted.0.value
            width = converted.1.value
        }
        
        let result = wallDims(canvasHeightMeters: height, canvasLengthMeters: width)
            print(result)
        
        let resultsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        
        resultsViewController.resultWallHeight = result.wallHeight
        resultsViewController.resultWallWidth = result.wallWidth
        resultsViewController.resultSingleHardware = result.singleHardware
        resultsViewController.resultDoubleHardware = result.doubleHarwdare
        resultsViewController.resultHeightFeet = result.wallWidthInFeet
        resultsViewController.resultWidthFeet = result.wallHeightInFeet
        resultsViewController.resultAspectRatio = result.wallAspectRatio
        resultsViewController.resultTotalPanels = result.totalPanels
        
       self.navigationController?.pushViewController(resultsViewController, animated: true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
