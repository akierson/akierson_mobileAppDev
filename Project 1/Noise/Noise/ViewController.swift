//
//  ViewController.swift
//  Noise
//
//  Created by Azariah Kierson-Galeano on 10/2/18.
//  Copyright © 2018 Azariah Kierson-Galeano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // TODO: Add Background image, add noise, color oscillations, timer
    
    // Global Vars
    // timer states: up_paused, up_on, down_paused, down_on
    var timerState : int;
    
    // Timer
    var timer : Timer;
    
    // Noise
    var noise;
    
    // Vars
    @IBOutlet weak var studyText: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var oscSlider: UISlider!
    @IBOutlet weak var volSlider: UISlider!
    @IBOutlet weak var hrzSlider: UISlider!
    
    // Functions
    //      helper func
    //      change studied text
    
    // when Study tapped
    // end timer and phase out noise
    
    // on tap again start noise and timer from point
    
    // When timer tapped
    // phase out noise and allow for time change
    // play timer in reverse
    
    // when osc changed
    @IBAction func oscChanged(_ sender: UISlider) {
        
    }
    
    // when vol changed
    @IBAction func volChanged(_ sender: UISlider) {
        
    }
    
    // when hrz changed
    @IBAction func hrzChanged(_ sender: UISlider) {
        
    }
    
    override func viewDidLoad() {
        // Start timer and white noise
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

