//
//  ViewController.swift
//  Simon Says
//
//  Created by Azariah Kierson-Galeano on 9/10/18.
//  Copyright © 2018 Azariah Kierson-Galeano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Image View outlet
    @IBOutlet weak var imageView: UIImageView!
    
    // Add references to buttons to allow for color change
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    
    // Add Functions for button presses
    // One per button for recall in main function
    @IBAction func yellowTap(_ sender: UIButton) {
        imageView.image = UIImage(named: "yellow")
    }
    @IBAction func redTap(_ sender: UIButton) {
        imageView.image = UIImage(named: "red")
    }
    @IBAction func greenTap(_ sender: UIButton) {
        imageView.image = UIImage(named: "green")
    }
    @IBAction func blueTap(_ sender: UIButton) {
        imageView.image = UIImage(named: "blue")
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

