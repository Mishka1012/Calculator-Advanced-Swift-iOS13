//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Mikhail Amshei on 12/14/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        guard let n = number else {
            fatalError("Unable to extract number for struct.")
        }
        //operations
        if symbol == "+/-" {
            return n * -1
        } else if symbol == "AC" {
            return 0
        } else if symbol == "%" {
            return n / 100
        } else if symbol == "=" {
            //trigger the entire calculation
            number = performTwoNumberCalculation(n2: n)
            intermediateCalculation = nil
            return number
        } else {
            // + - * /
            number = performTwoNumberCalculation(n2: n)
            intermediateCalculation = (n1: number!, calcMethod: symbol)
            return number
        }
    }
    private func performTwoNumberCalculation(n2: Double) -> Double {
        guard let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod else {
            return n2
        }
        switch operation {
        case "+":
            return n1 + n2
        case "-":
            return n1 - n2
        case "×":
            return n1 * n2
        case "÷":
            return n1 / n2
        default:
            return n2
        }
    }
}
