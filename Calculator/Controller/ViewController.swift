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
    //this variable is only accessible within this class
    private var isFinishedTypingNumber: Bool = true
    //all calculations
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        //calculation
        guard let number = Double(displayLabel.text!) else {
            fatalError("Non Number String Cast: \(displayLabel.text)")
        }
        guard let calcMethod = sender.currentTitle else {
            fatalError("Calc button missing text")
        }
        if calcMethod == "+/-" {
            displayLabel.text = String(number * -1)
            //isFinishedTypingNumber = false
        } else if calcMethod == "AC" {
            displayLabel.text = "0"
        } else if calcMethod == "%" {
            displayLabel.text = String(number / 100)
            //isFinishedTypingNumber = false
        }
    }
    //all numbers
    @IBAction func numButtonPressed(_ sender: UIButton) {
        //What should happen when a number is entered into the keypad
        guard let number = sender.currentTitle else {
            fatalError("Number button title returned nil!")
        }
        guard isFinishedTypingNumber else {
            displayLabel.text?.append(number)
            return
        }
        isFinishedTypingNumber = false
        displayLabel.text = number
    }
}

