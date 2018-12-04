//
//  ResultsViewController.swift
//  LEDwallApp
//
//  Created by Travis Brigman on 8/21/18.
//  Copyright © 2018 Travis Brigman. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var resultWallHeight: Int?
    var resultWallWidth: Int?
    var resultDoubleHardware: Int?
    var resultSingleHardware: Int?
    var resultHeightFeet: Double?
    var resultWidthFeet: Double?
    var resultAspectRatio: Double?
    var resultTotalPanels: Int?
    
    @IBOutlet weak var wallHeightLabel: UILabel!
    @IBOutlet weak var wallWidthLabel: UILabel!
    @IBOutlet weak var doubleHardwareLabel: UILabel!
    @IBOutlet weak var singleHardwareLabel: UILabel!
    @IBOutlet weak var wallHeightFeelLabel: UILabel!
    @IBOutlet weak var wallWidthFeetLabel: UILabel!
    @IBOutlet weak var WallAspectRatioLabel: UILabel!
    @IBOutlet weak var totalPanelLabel: UILabel!
    
    
   
    @IBAction func arViewButton(_ sender: Any) {
        print("button mashed")
        performSegue(withIdentifier: "arViewSegue", sender: self)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wallHeightLabel.text = String(resultWallHeight!)
        wallWidthLabel.text = String(resultWallWidth!)
        doubleHardwareLabel.text = String(resultDoubleHardware!)
        singleHardwareLabel.text = String(resultSingleHardware!)
        wallHeightFeelLabel.text = String(resultHeightFeet!)
        wallWidthFeetLabel.text = String(resultWidthFeet!)
        WallAspectRatioLabel.text = String(resultAspectRatio!)
        totalPanelLabel.text = String(resultTotalPanels!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
