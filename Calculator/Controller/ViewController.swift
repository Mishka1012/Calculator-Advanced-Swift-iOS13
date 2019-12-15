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
    //computed properties
    private var displayValue: Double {
        get {
            guard let display = Double(displayLabel.text!) else {
                fatalError("Unable to convert display label to double")
            }
            return display
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    //all calculations
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        //calculation
        guard let calcMethod = sender.currentTitle else {
            fatalError("Calc button missing text")
        }
        if calcMethod == "+/-" {
            displayValue *= -1
            //isFinishedTypingNumber = false
        } else if calcMethod == "AC" {
            displayValue = 0
        } else if calcMethod == "%" {
            displayValue /= 100
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
            if number == "." {
                let isInt: Bool = floor(displayValue) == displayValue
                if !isInt {
                    //this is bullshit, number already has a decimal point
                    return
                }
            }
            displayLabel.text?.append(number)
            return
        }
        isFinishedTypingNumber = false
        displayLabel.text = number
    }
}

