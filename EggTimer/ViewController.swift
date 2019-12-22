//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes : [String : Int] = [
        "Soft": 5,
        "Medium": 7,
        "Hard": 12
    ]
    
    var secondsRemaining = 0
    var timer = Timer()
    
    @IBOutlet weak var topLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        // Kill any previous timers
        timer.invalidate()
        
        // Force unwrap sender.currentTitle
        let hardness = sender.currentTitle!
        
        // Get the seconds remaining
        secondsRemaining = eggTimes[hardness]!
        
        // Set the timer
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        if secondsRemaining > 0 {
            print(secondsRemaining)
            topLabel.text = "Time remaining: \(secondsRemaining) seconds"
            secondsRemaining -= 1
        }
        else {
            timer.invalidate()
            topLabel.text = "Done!"
        }
    }
}
  
