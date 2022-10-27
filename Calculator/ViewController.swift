//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        guard let number = Double(displayLabel.text!) else { fatalError() }
        
        if let button = sender.currentTitle {
            switch button {
            case "+/-":
                displayLabel.text = String(number * -1)
            case "%":
                displayLabel.text = String(number / 100)
            case "AC":
                displayLabel.text = "0"
            default:
                displayLabel.text = String(number)
            }
        }
        
        isFinishedTypingNumber = true
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                displayLabel.text! += numValue
            }
        }
        
    }
    
}

