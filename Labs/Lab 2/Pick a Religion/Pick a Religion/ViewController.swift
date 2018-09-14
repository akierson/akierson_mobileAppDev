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
    @IBOutlet weak var pcButton: UIBarButtonItem!
    @IBOutlet weak var religionPicker: UISegmentedControl!
    @IBOutlet weak var religionLevel: UISlider!
    
    // Helper functions
    func updateImage() {
        if religionLevel.value < 5 {
            imageView.image = UIImage(named: <#T##String#>)
        }
    }
    func updateText() {
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
    
    @IBAction func religionPickerFunc(_ sender: UISegmentedControl) {
        updateImage()
        updateText()
    }
    
    @IBAction func religionLvlFunc(_ sender: UISlider) {
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

