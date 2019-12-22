//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes : [String : Int] = [
        "Soft": 5*60,
        "Medium": 7*60,
        "Hard": 12*60
    ]
    
    var secondsRemaining = 0
    var totalSeconds = 0
    var timer = Timer()
    var player: AVAudioPlayer!
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        // Kill any previous timers
        timer.invalidate()
        
        // Reset the progress bar
        progressBar.progress = 0.0
        
        // Force unwrap sender.currentTitle
        let hardness = sender.currentTitle!
        topLabel.text = hardness
        
        // Get the seconds remaining
        totalSeconds = eggTimes[hardness]!
        secondsRemaining = eggTimes[hardness]!
        
        // Set the timer
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        if secondsRemaining > 0 {
            
            secondsRemaining -= 1
            
            let progress = Float(totalSeconds - secondsRemaining) / Float(totalSeconds)
            
            print("\(totalSeconds) \(secondsRemaining) \(progress)")
            progressBar.progress = progress
        }
        else {
            timer.invalidate()
            topLabel.text = "Done!"
            playSound(soundName: "alarm_sound")
        }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
  
