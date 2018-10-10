//
//  fighterSelect.swift
//  pickYourFighter
//
//  Created by Azariah Kierson-Galeano on 10/10/18.
//  Copyright © 2018 Azariah Kierson-Galeano. All rights reserved.
//

import UIKit

class fighterSelect: UIViewController, UITextFieldDelegate {
    // outlets
    @IBOutlet weak var fighterName: UITextField!
    @IBOutlet weak var fighterType: UISegmentedControl!
    @IBOutlet weak var fighterImg: UIImageView!
    // Stats
    @IBOutlet weak var fighterMaxPoints: UILabel!
    @IBOutlet weak var fighterStrengthPt: UILabel!
    @IBOutlet weak var fighterSpeedPt: UILabel!
    @IBOutlet weak var fighterSatanismPt: UILabel!
    // Steppers
    @IBOutlet weak var strengthStepper: UIStepper!
    @IBOutlet weak var speedStepper: UIStepper!
    @IBOutlet weak var satanismStepper: UIStepper!
    
    let maxPts = 10
    var currentPts : Int?
    
    // Seg control Changes
    @IBAction func segControlFunc(_ sender: UISegmentedControl) {
        switch fighterType.selectedSegmentIndex {
        case 0:
            fighterImg.image = UIImage(named: "red")
        case 1:
            fighterImg.image = UIImage(named: "yellow")
        case 2:
            fighterImg.image = UIImage(named: "blue")
        case 3:
            fighterImg.image = UIImage(named: "green")
        default:
            break
        }
    }
    
    // Hide Text field on change
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Stepper Functions
    @IBAction func strengthStepperFunc(_ sender: UIStepper) {
        // Get current values
        let strPt = intmax_t(fighterStrengthPt.text!)
        let newVal = intmax_t(strengthStepper.value)
        
        // change current pts
        if newVal > (strPt)! {
            currentPts = currentPts! + 1
        } else {
            currentPts = currentPts! - 1
        }
        
        // set label
        fighterMaxPoints.text = String(maxPts - currentPts!)
        fighterStrengthPt.text = String(newVal)
        
        // Set other steppers max
        if speedStepper.value >  Double(maxPts - currentPts!){
            speedStepper.maximumValue = speedStepper.value + Double( maxPts - currentPts!)
        } else {
            speedStepper.maximumValue = Double(maxPts - currentPts!)
        }
        if satanismStepper.value > Double(maxPts - currentPts!) {
            satanismStepper.maximumValue = satanismStepper.value + Double( maxPts - currentPts!)
        } else {
            satanismStepper.maximumValue = Double(maxPts - currentPts!)
        }
    }
    
    @IBAction func speedStepperFunc(_ sender: UIStepper) {
        // Get current values
        let strPt = intmax_t(fighterSpeedPt.text!)
        let newVal = intmax_t(speedStepper.value)
        
        // change current pts
        if newVal > (strPt)! {
            currentPts = currentPts! + 1
        } else {
            currentPts = currentPts! - 1
        }
        
        // set label
        fighterMaxPoints.text = String(maxPts - currentPts!)
        fighterSpeedPt.text = String(newVal)
        
        // Set other steppers max
        if strengthStepper.value >  Double(maxPts - currentPts!){
            strengthStepper.maximumValue = strengthStepper.value + Double( maxPts - currentPts!)
        } else {
            strengthStepper.maximumValue = Double(maxPts - currentPts!)
        }
        if satanismStepper.value > Double(maxPts - currentPts!) {
            satanismStepper.maximumValue = satanismStepper.value + Double( maxPts - currentPts!)
        } else {
            satanismStepper.maximumValue = Double(maxPts - currentPts!)
        }
    }
    
    @IBAction func satanismStepperFunc(_ sender: UIStepper) {
        // Get current values
        let strPt = intmax_t(fighterSatanismPt.text!)
        let newVal = intmax_t(satanismStepper.value)
        
        // change current pts
        if newVal > (strPt)! {
            currentPts = currentPts! + 1
        } else {
            currentPts = currentPts! - 1
        }
        
        // set label
        fighterMaxPoints.text = String(maxPts - currentPts!)
        fighterSatanismPt.text = String(newVal)
        
        // Set other steppers max
        if strengthStepper.value >  Double(maxPts - currentPts!){
            strengthStepper.maximumValue = strengthStepper.value + Double( maxPts - currentPts!)
        } else {
            strengthStepper.maximumValue = Double(maxPts - currentPts!)
        }
        if speedStepper.value > Double(maxPts - currentPts!) {
            speedStepper.maximumValue = speedStepper.value + Double( maxPts - currentPts!)
        } else {
            speedStepper.maximumValue = Double(maxPts - currentPts!)
        }
    }
    
    override func viewDidLoad() {
        // Set delegate for text field
        fighterName.delegate = self
        currentPts = 0
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let prevScene = segue.destination as! ViewController
        // Get the new view controller using segue.destinationViewController.
        if fighterName.text!.isEmpty == false {
            prevScene.fighter.type = fighterType.selectedSegmentIndex
            prevScene.fighter.name = fighterName.text
            prevScene.fighter.strength = fighterStrengthPt.text
            prevScene.fighter.speed = fighterSpeedPt.text
            prevScene.fighter.satanism = fighterSatanismPt.text
        }
        // Pass the selected object to the new view controller.
    }

}
