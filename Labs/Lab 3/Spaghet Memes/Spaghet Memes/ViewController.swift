//
//  ViewController.swift
//  Spaghet Memes
//
//  Created by Azariah Kierson-Galeano on 9/26/18.
//  Copyright © 2018 Azariah Kierson-Galeano. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    // Text Field Vars
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var widthTextField: UITextField!
    @IBOutlet weak var depthTextField: UITextField!
    // Segmented Control Vars
    @IBOutlet weak var sauceSegControl: UISegmentedControl!
    
    // Labels to set
    @IBOutlet weak var pastaVolLabel: UILabel!
    @IBOutlet weak var sauceVolLabel: UILabel!
    @IBOutlet weak var SpagWeightLabel: UILabel!
    
    
    // Control Function
    func updateText(){
        
        var height, width, depth : Measurement<Unit>
        // Get Text Fields
        if Locale.current.usesMetricSystem {
            height = Measurement(value: Double(heightTextField.text!)!, unit: UnitLength.meters)
            width = Measurement(value: Double(widthTextField.text!)!, unit: UnitLength.meters)
            depth = Measurement(value: Double(depthTextField.text!)!, unit: UnitLength.meters)
        } else {
            height = Measurement(value: Double(heightTextField.text!)!, unit: UnitLength.feet)
            width = Measurement(value: Double(widthTextField.text!)!, unit: UnitLength.feet)
            depth = Measurement(value: Double(depthTextField.text!)!, unit: UnitLength.feet)
        }
        height = height.convert(to: UnitLength.feet)
        width.convert(to: UnitLength.feet)
        depth.convert(to: UnitLength.feet)
        
        // Get Seg controls
        let sauceAmount = sauceSegControl.selectedSegmentIndex + 1
        
        // Get total volume and divide by amount of sauce
        let vol = height.value * width.value * depth.value
        var p_vol = vol / Double(sauceAmount)
        var s_vol = vol - p_vol
        
        // Pasta = 494 oz / ft^3
        // Sauce =  907 oz / ft^3
        let p_weight = (494.0 * p_vol)/16.0
        let s_weight = (907.0 * s_vol)/16.0
        var sp_weight = p_weight + s_weight
        
        // If not American
        if Locale.current.usesMetricSystem {
            p_vol = p_vol * 28.317
            s_vol = s_vol * 28.317
            sp_weight = p_weight * 0.453
        }
        
        // Set labels
        pastaVolLabel.text = String(p_vol)
        sauceVolLabel.text = String(s_vol)
        SpagWeightLabel.text = String(sp_weight)
    }
    // TODO: add tap off, add keyboard resigning, add country formatting, add general formatting, add app icons, add launch screen, make screen move up on keyboard
    func textFieldDidEndEditing(_ textField: UITextField) {
        
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

