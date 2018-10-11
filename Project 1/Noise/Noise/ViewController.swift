//
//  ViewController.swift
//  Noise
//
//  Created by Azariah Kierson-Galeano on 10/2/18.
//  Copyright © 2018 Azariah Kierson-Galeano. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    // TODO: Add Background image, add noise, color oscillations, timer
    
    // Global Vars
    
    // Timer
    var timer = Timer();
    // Time in seconds
    var time : intmax_t?
    
    // Noise
    var player : AVAudioPlayer?
    
//    var max_vol
//    var hrz
    
    // Vars
    @IBOutlet weak var studyText: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var oscSlider: UISlider!
    @IBOutlet weak var volSlider: UISlider!
    @IBOutlet weak var hrzSlider: UISlider!
    
    // Functions
    //      helper func
    
    // Code based on https://stackoverflow.com/questions/32036146/how-to-play-a-sound-using-swift/47874593
    func playSound() {
        guard let url = Bundle.main.url(forResource: "noise", withExtension: "wav")
            else {
                print("File failed to load")
                return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            // Set Player params
            player?.numberOfLoops = -1
            player?.volume = volSlider.value
            // add osc, hrz
            guard let player = player
                else {
                    print("Player failed to load")
                    return
            }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    //      change studied text
    func updateStudiedText() {
        if studyText.currentTitle == "Study" {
            studyText.setTitle("Studied For", for: .normal)
        } else {
            studyText.setTitle("Study", for: .normal)
        }
    }
    //      update time
    @objc func updateTime() {
        time = time! + 1
        let h = time! / 3600
        let m = (time! % 3600) / 60
        let s = time! % 60
        
        timerLabel.text = String(format: "%02d", h) + ":" + String(format: "%02d", m) + ":" + String(format: "%02d", s)
        
    }
    
    // when Study tapped
    @IBAction func studyTapFunc(_ sender: UIButton) {
        // Start Timer and sound
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
            updateStudiedText()
            // Start sound
            playSound()
        }
        // End timer and phase out noise
        else {
            timer.invalidate()
            updateStudiedText()
            // Stop Noise
        }
    }
    
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
        time = 0
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

