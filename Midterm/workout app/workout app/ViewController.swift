//
//  ViewController.swift
//  workout app
//
//  Created by Azariah Kierson-Galeano on 10/18/18.
//  Copyright © 2018 Azariah Kierson-Galeano. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    // Outlets
    @IBOutlet weak var workoutTime: UITextField!
    @IBOutlet weak var weeklySwtich: UISwitch!
    @IBOutlet weak var weeklyWorkouts: UISlider!
    @IBOutlet weak var weeklyWorkoutsLabel: UILabel!
    @IBOutlet weak var typeSegControl: UISegmentedControl!
    @IBOutlet weak var workoutButton: UIButton!
    @IBOutlet weak var milesLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var typeImage: UIImageView!
    
    //global Vars
    var calories : float_t = 0.0
    var miles : float_t = 0.0
    
    //Helper Funcs
    func calcTime () {
        var time : float_t
        // get workout time
        if (workoutTime.text?.isEmpty)! {
            time = 0
        } else {
            time = float_t(workoutTime.text!)!
        }
    
        // switch for seg type
        switch typeSegControl.selectedSegmentIndex {
        case 0:
            calories = time * 10.0
            miles = time * 0.1
        case 1:
            calories = time * 8.5
            miles = time * 0.25
        case 2:
            calories = time * 7.0
            miles = time * 0.033333
        default:
            break
        }
        
        // accomadate for weekly
        if weeklySwtich.isOn {
            calories = calories * weeklyWorkouts.value
            miles = miles * weeklyWorkouts.value
        }
        
        // Set labels
        caloriesLabel.text = String(format: "%.2f", calories) + " calories"
        milesLabel.text = String(format: "%.2f", miles) + " miles"
    }
    
    //Funcs
    @IBAction func workoutFunc(_ sender: UIButton) {
        calcTime()
    }
    
    // Changes image and calculation types
    @IBAction func typeSegControlFunc(_ sender: Any) {
        switch typeSegControl.selectedSegmentIndex {
        case 0:
            typeImage.image = UIImage(named: "run")
        case 1:
            typeImage.image = UIImage(named: "bike")
        case 2:
            typeImage.image = UIImage(named: "swim")
        default:
            break
        }
        
        calcTime()
    }
    
    // Update Label
    @IBAction func weeklyWorkoutFunc(_ sender: UISlider) {
        weeklyWorkoutsLabel.text = String(format: "%.0f", weeklyWorkouts.value)
    }
    
    // weekly Switch Statement
    @IBAction func weeklySwitchFunc(_ sender: UISwitch) {
        if sender.isOn {
            calories = calories * weeklyWorkouts.value
            miles = miles * weeklyWorkouts.value
        } else {
            calories = calories / weeklyWorkouts.value
            miles = miles / weeklyWorkouts.value
        }
        caloriesLabel.text = String(format: "%.2f", calories) + " calories"
        milesLabel.text = String(format: "%.2f", miles) + " miles"
    }
    
    // Resign First responder/hide keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // Unsure how to make sure numbers are in field while still having return key available
        if !(textField.text?.isEmpty)! {
            if Double(textField.text!)! < 30.0 {
                //create a UIAlertController object
                let alert = UIAlertController(title: "Workout time is too short!", message: "Don't be a wimp!", preferredStyle: UIAlertControllerStyle.alert)
                //create a UIAlertAction object for the button
                let cancelAction = UIAlertAction(title: "I'm a wimp", style:UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(cancelAction) //adds the alert action to the alert object
                let okAction=UIAlertAction(title: "Get jacked!", style: UIAlertActionStyle.default, handler: {
                    action in self.workoutTime.text = "30"})
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
                return false
            }
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        calcTime()
    }
    
    override func viewDidLoad() {
        workoutTime.delegate = self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

