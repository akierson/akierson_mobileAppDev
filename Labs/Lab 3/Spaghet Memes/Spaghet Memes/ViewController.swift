//
//  ViewController.swift
//  Spaghet Memes
//
//  Created by Azariah Kierson-Galeano on 9/26/18.
//  Copyright © 2018 Azariah Kierson-Galeano. All rights reserved.
//

import UIKit

// Move things up on smaller keyboards
class ViewController: UIViewController, UITextFieldDelegate {
    // Text Field Labels
    @IBOutlet weak var heightTextLabel: UILabel!
    @IBOutlet weak var widthTextLabel: UILabel!
    @IBOutlet weak var depthTextLabel: UILabel!
    
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
        
        var height, width, depth : Measurement<UnitLength>
        // Get Text Fields
        if heightTextField.text!.isEmpty || widthTextField.text!.isEmpty || depthTextField.text!.isEmpty {
            height = Measurement(value: 0, unit: UnitLength.feet)
            width = Measurement(value: 0, unit: UnitLength.feet)
            depth = Measurement(value: 0, unit: UnitLength.feet)
        } else if Locale.current.usesMetricSystem {
            height = Measurement(value: Double(heightTextField.text!)!, unit: UnitLength.meters)
            width = Measurement(value: Double(widthTextField.text!)!, unit: UnitLength.meters)
            depth = Measurement(value: Double(depthTextField.text!)!, unit: UnitLength.meters)
        } else {
            height = Measurement(value: Double(heightTextField.text!)!, unit: UnitLength.feet)
            width = Measurement(value: Double(widthTextField.text!)!, unit: UnitLength.feet)
            depth = Measurement(value: Double(depthTextField.text!)!, unit: UnitLength.feet)
        }
        height = height.converted(to: UnitLength.feet)
        width = width.converted(to: UnitLength.feet)
        depth = depth.converted(to: UnitLength.feet)
        
        // Get Seg controls
        let sauceAmount = sauceSegControl.selectedSegmentIndex + 1
        
        // Get total volume and divide by amount of sauce
        let vol = height.value * width.value * depth.value
        var p_vol = Measurement(value: vol / Double(sauceAmount), unit: UnitVolume.cubicFeet)
        var s_vol = Measurement(value: vol - p_vol.value, unit: UnitVolume.cubicFeet)
        
        // Pasta = 494 oz / ft^3
        // Sauce =  907 oz / ft^3
        let p_weight = (494.0 * p_vol.value)/16.0
        let s_weight = (907.0 * s_vol.value)/16.0
        var sp_weight = Measurement(value: p_weight + s_weight, unit: UnitMass.pounds)
        
        // If not American
        if Locale.current.usesMetricSystem {
            p_vol = p_vol.converted(to: UnitVolume.liters)
            s_vol = s_vol.converted(to: UnitVolume.liters)
            sp_weight = sp_weight.converted(to: UnitMass.kilograms)
        }
        
        // Set labels
        pastaVolLabel.text = p_vol.description
        sauceVolLabel.text = s_vol.description
        SpagWeightLabel.text = sp_weight.description
    }
    
    // Vhange text when done editting a field
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateText()
    }
    
    // Hide keyboard on return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // From Coding Explorer
    // Hides any editing device in view on touch start
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    // Updates text on segmented control change
    @IBAction func segControlChange(_ sender: UISegmentedControl) {
        updateText()
    }
    
    override func viewDidLoad() {
        // Set Text Field Labels
        if Locale.current.usesMetricSystem {
            heightTextLabel.text = "Height (m)"
            widthTextLabel.text = "Width (m)"
            depthTextLabel.text = "Depth (m)"
        }
        
        // Set Delegates
        heightTextField.delegate = self
        widthTextField.delegate = self
        depthTextField.delegate = self
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

