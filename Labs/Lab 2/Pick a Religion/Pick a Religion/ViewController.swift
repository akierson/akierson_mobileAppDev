//
//  ViewController.swift
//  Pick a Religion
//
//  Created by Azariah Kierson-Galeano on 9/14/18.
//  Copyright © 2018 Azariah Kierson-Galeano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textBox: UITextView!
    // Control Outlets
    @IBOutlet weak var pgSwitch: UISwitch!
    @IBOutlet weak var fruitLevel: UISlider!
    @IBOutlet weak var fruitPicker: UISegmentedControl!
    
    // Helper functions
    func updateImage() {
        let f_level = Int(fruitLevel.value/3.0)
        let f_type = fruitPicker.selectedSegmentIndex
        switch f_type {
        case 0:
            imageView.image = UIImage(named: "red_" + String( f_level))
        case 1:
            imageView.image = UIImage(named: "yellow_" + String( f_level))
        case 2:
            imageView.image = UIImage(named: "blue_" + String( f_level))
        case 3:
            imageView.image = UIImage(named: "green_" + String( f_level))
        default:
            print("Segmented control out of range")
        }
    }
    
    func updateText() {
        let expletive = pgSwitch.isOn ? "" : "fucking"
        let f_level = fruitLevel.value
        let f_type = fruitPicker.selectedSegmentIndex
        
        // Switch case for different fruits
        switch f_type {
        // Apples
        case 0:
            switch f_level{
            case 0...4:
                textBox.text = """
                Base Level Cultist
                + Speed:
                + Money:
                - Like Scientologists but worse
                """
            case 5...7:
                textBox.text = """
                Tech Reviewer Cultist
                + Acquire speed:
                + Money:
                - Empathy:
                """
            case 8...:
                textBox.text = """
                Apple Overlord
                + V̅̌ͣ͂̀̓ͦͨ̌̇ͩͪ̃Ë̄͑̄ͥ̐ͩͦͣͮ̊͗ͤͮ͆̋͌͑
                + T̆̍ͤ͌̍ͬ̂͊̈́̂̊͋Eͤ͗̃̒͒ͩV̊̎̈͌͋ͩ̌ͭ͒̅ͣ̐́̄̍ͧ̽̈́
                - S̜̣͉̯̞̖̖̥̫̠̠̦̗̓̓ͮ̈́̃͋̏ͧͨ̓̂̎̉̅T͍̞̱̫̗̘̼̩̭̄̄ͬ͗̔ͥ̄͐͊̃̿͊͒̏ͧͪ̓̉ͅĔ̻̪̝̬͈̼͍̥̍͆͆́ͣͩͨ̔ͥ̂͆ͯ́ͩ́
                """
            default:
                print("Level Control out of range")
            }
        //Bananas
        case 1:
            switch f_level{
            case 0...4:
                textBox.text = """
                Split
                + Eyepatch
                + Brownness: \(f_level)
                - Phallic
                """
            case 5...7:
                textBox.text = """
                Rambonana
                + Two Eyepatches
                + Brownness: \(f_level)
                + Really Cool
                """
            case 8...:
                textBox.text = """
                Predator Naner
                + Dreads
                + Brownness: \(f_level)
                + Like Really, really cool
                """
            default:
                print("Level Control out of range")
            }
        // Blue Berries
        case 2:
            switch f_level{
            case 0...4:
                textBox.text = """
                Bluetallica
                + Base Tier coolness
                +
                """
            case 5...7:
                textBox.text = """
                Blue Maiden
                +
                """
            case 8...:
                textBox.text = """
                Nowegian Blue Metal Band
                + Probably  Dead
                + Is part of the forest
                - Inacessible to most people
                """
            default:
                print("Level Control out of range")
            }
        // Avocado
        case 3:
            switch f_level{
            case 0...4:
                textBox.text = """
                Split
                + Eyepatch
                + Brownness:
                - Phallic
                """
            case 5...7:
                textBox.text = """
                Rambonana
                + Two Eyepatches
                + Brownness
                + Really Cool
                """
            case 8...:
                textBox.text = """
                Predator Naner
                + Dreads
                + Brownness
                + Like Really, really cool
                """
            default:
                print("Level Control out of range")
            }
        default:
            break
        }
        // update some stats based on level
        // update color by religion and level
        // all start black go to (yellow, blue, black)
        // add more text at 5, 8
        // change fonts at 5, 8
        // capitalize on evens
    }
    // Control Functions
    @IBAction func pcButtonFunc(_ sender: UIBarButtonItem) {
        // Disable all options and set text to "You are not prepared"?
    }
    @IBAction func fruitPickerFunc(_ sender: UISegmentedControl) {
        updateImage()
        updateText()
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

