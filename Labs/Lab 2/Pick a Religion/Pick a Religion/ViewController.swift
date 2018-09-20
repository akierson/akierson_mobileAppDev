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
    @IBOutlet weak var levelLabel: UILabel!
    // Control Outlets
    @IBOutlet weak var pgSwitch: UISwitch!
    @IBOutlet weak var fruitLevel: UISlider!
    @IBOutlet weak var fruitPicker: UISegmentedControl!
    
    // Helper functions
    func updateImage() {
        let f_level = Int(fruitLevel.value/3.5)
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
        let expletive = pgSwitch.isOn ? "" : "FUCKING"
        let f_level = Int(fruitLevel.value)
        let f_type = fruitPicker.selectedSegmentIndex
        
        // Switch case for different fruits
        switch f_type {
        // Apples
        case 0:
            textBox.textColor = UIColor(red: 0.5, green: 0, blue: 0, alpha: 1)
            switch f_level{
            case 0...4:
                textBox.text = """
                Base Level Cultist
                + Speed:
                + Money:
                - Like \(expletive) Scientologists but worse
                """
            case 5...7:
                textBox.text = """
                Tech Reviewer Cultist
                + Acquire speed
                + Money: \(expletive) \(f_level) thousand dollars
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
            textBox.textColor = UIColor(red: 0.5, green: 0.5, blue: 0, alpha: 1)
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
                + Like Really, really \(expletive) cool
                """
            default:
                print("Level Control out of range")
            }
        // Blue Berries
        case 2:
            textBox.textColor = UIColor(red: 0, green: 0, blue: 0.5, alpha: 1)
            switch f_level{
            case 0...4:
                textBox.text = """
                Bluetallica
                + Base tier coolness
                + Wicked guitar rifts
                - Too normal
                """
            case 5...7:
                textBox.text = """
                Blue Maiden
                + Epic
                + Epic
                + Epic
                """
            case 8...:
                textBox.text = """
                Nowegian Blue Metal Band
                + Probably \(expletive) Dead
                + Is part of the forest
                - Inacessible to most people
                """
            default:
                print("Level Control out of range")
            }
        // Avocado
        case 3:
            textBox.textColor = UIColor(red: 0, green: 0.5, blue: 0, alpha: 1)
            switch f_level{
            case ...4:
                textBox.text = """
                Pleb
                + Massive eye
                + Like Mother Nature's boogers
                - No legs
                """
            case 5...7:
                textBox.text = """
                Transcendent
                + Hovers, \(expletive) awesome
                + Beholder eye
                + Like Mother Nature's boogers
                """
            case 8...:
                textBox.text = """
                Diety
                + Made of green \(expletive) slime
                + Like Mother Nature's booger
                - Pulls the race card
                """
            default:
                print("Level Control out of range")
            }
        default:
            break
        }
    }
    func updateLevel() {
        levelLabel.text = "Level " + String(Int(fruitLevel.value))
    }
    // Control Functions
    @IBAction func pcButtonFunc(_ sender: UIBarButtonItem) {
        // Disable all options and set text to "You are not prepared"?
    }
    @IBAction func fruitPickerFunc(_ sender: UISegmentedControl) {
        updateImage()
        updateText()
        updateLevel()
    }
    @IBAction func fruitLevelFunc(_ sender: UISlider) {
        updateImage()
        updateText()
        updateLevel()
    }
    @IBAction func pcSwitchFunc(_ sender: UISwitch) {
        updateImage()
        updateText()
        updateLevel()
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

