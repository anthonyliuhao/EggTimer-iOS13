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
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        // Force unwrap sender.currentTitle
        let hardness = sender.currentTitle!
        
        switch hardness {
        case "Soft":
            print(eggTimes[hardness]!) // Force unwrap the optional integer
        case "Medium":
            print(eggTimes[hardness]!)
        case "Hard":
            print(eggTimes[hardness]!)
        default:
            print("Error")
        }
    }
    

}
  
