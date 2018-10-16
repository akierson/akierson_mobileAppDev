//
//  ViewController.swift
//  Noise
//
//  Created by Azariah Kierson-Galeano on 10/2/18.
//  Copyright © 2018 Azariah Kierson-Galeano. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {
    // TODO: Add Background image, add noise, color oscillations, timer
    
    // Global Vars
    
    // Timer
    var timer = Timer();
    // Time in seconds
    var time : intmax_t?
    
    // Noise
    var max_vol : float_t = 1.0
    var vol : float_t?
    var hrz : float_t?
    var timerOsc = Timer()
    var oscVol : float_t?
    
    // AVAudio Nodes
    let engine = AVAudioEngine()
    let speedControl = AVAudioUnitVarispeed()
    let pitchControl = AVAudioUnitTimePitch()
    let audioPlayer = AVAudioPlayerNode()
    let file = AVAudioFile()
    // playback repeat timer
    var playbackTimer = Timer()
    
    // Vars
    @IBOutlet weak var studyText: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var oscSlider: UISlider!
    @IBOutlet weak var volSlider: UISlider!
    @IBOutlet weak var hrzSlider: UISlider!
    
    // Functions
    //      helper func
    func startEngine() throws {
        
        // Get url of noise.wav file
        guard let url = Bundle.main.url(forResource: "noise", withExtension: "wav")
            else {
                print("Couldn't find file")
                return
        }
        
        // Load File
        guard let file = try? AVAudioFile(forReading: url)
            else {
                print("File failed to load")
                return
        }
        
        // Connect nodes to engine
        engine.attach(audioPlayer)
        engine.attach(pitchControl)
        engine.attach(speedControl)
        
        // Connect nodes
        engine.connect(audioPlayer, to: speedControl, format: nil)
        engine.connect(speedControl, to: pitchControl, format: nil)
        engine.connect(pitchControl, to: engine.mainMixerNode, format: nil)
        
        // Start audio player
        audioPlayer.scheduleFile(file, at:nil)
        
        
        //start engine
        try engine.start()
    }
    
    // Change studied text
    func updateStudiedText() {
        if studyText.currentTitle == "Study" {
            studyText.setTitle("Studied For", for: .normal)
        } else {
            studyText.setTitle("Study", for: .normal)
        }
    }
    // Update time
    @objc func updateTime() {
        time = time! + 1
        let h = time! / 3600
        let m = (time! % 3600) / 60
        let s = time! % 60
        
        timerLabel.text = String(format: "%02d", h) + ":" + String(format: "%02d", m) + ":" + String(format: "%02d", s)
    }
    @objc func updateOsc() {
        if oscSlider.value == 0.0 {
            vol = max_vol
        } else {
            oscVol = oscVol! + 0.01
            vol = max_vol * ((sin(Float(oscVol!)/oscSlider.value) + 1) * 0.5) + 0.1
            audioPlayer.volume = vol!
        }
    }
    
    @objc func updatePlayback() {
        // Get url of noise.wav file
        guard let url = Bundle.main.url(forResource: "noise", withExtension: "wav")
            else {
                print("Couldn't find file")
                return
        }
        
        // Load File
        guard let file = try? AVAudioFile(forReading: url)
            else {
                print("File failed to load")
                return
        }
        audioPlayer.scheduleFile(file, at:nil)
        audioPlayer.play()
    }
    
    // when Study tapped
    @IBAction func studyTapFunc(_ sender: UIButton) {
        // Start Timer and sound
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
            updateStudiedText()
            playbackTimer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(self.updatePlayback), userInfo: nil, repeats: true)
            guard let url = Bundle.main.url(forResource: "noise", withExtension: "wav")
                else {
                    print("Couldn't find file")
                    return
            }
            
            // Load File
            guard let file = try? AVAudioFile(forReading: url)
                else {
                    print("File failed to load")
                    return
            }
            audioPlayer.scheduleFile(file, at:nil)
            // Start sound
            audioPlayer.play()
        }
        // End timer and phase out noise
        else {
            timer.invalidate()
            playbackTimer.invalidate()
            timerOsc.invalidate()
            updateStudiedText()
            // Stop Noise
            audioPlayer.stop()
        }
    }
    
    // when osc changed
    @IBAction func oscChanged(_ sender: UISlider) {
        timerOsc = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateOsc), userInfo: nil, repeats: true)
    }
    
    // when vol changed
    @IBAction func volChanged(_ sender: UISlider) {
        max_vol = volSlider.value
        vol = max_vol
        audioPlayer.volume = vol!
    }
    
    // when hrz changed
    @IBAction func hrzChanged(_ sender: UISlider) {
        pitchControl.pitch = hrzSlider.value
    }
    
    override func viewDidLoad() {
        // Start timer and white noise
        time = 0
        oscVol = 0
        do {
            try startEngine()
        } catch {
            print("error")
        }
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

