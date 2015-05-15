//
//  ViewController.swift
//  Calculator2
//
//  Created by Azizi Khalid on 13/5/15.
//  Copyright (c) 2015 Brainstorm Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var operation = ""
    let π = M_PI

    @IBOutlet weak var display: UILabel!

    @IBOutlet weak var operationDisplay: UILabel!
    
    var userIsTyping = false

    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsTyping {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsTyping = true
        }
    }
    
    var operandStack = [Double]()
    var operationLabel = String()

    @IBAction func operate(sender: UIButton) {
        operation = sender.currentTitle!
        userIsTyping = false
        operandStack.append(displayValue)
        println(operandStack)
        operationDisplay.text = sender.currentTitle!
    }
    
    @IBAction func operationEqual() {
        operandStack.append(displayValue)
        userIsTyping = false
        println(operandStack)
        operationDisplay.text = "="
        
        switch operation {
        case "×" : performOperation { $0 * $1}
        case "÷" : performOperation { $1 / $0}
        case "+" : performOperation { $0 + $1}
        case "−" : performOperation { $1 - $0}
        case "√" : performOperation2 { sqrt($0)}
        case "sin" : performOperation2 { sin($0)}
        case "cos" : performOperation2 { cos($0)}
        case "π" : performOperation2 { self.π * ($0)}
            
        default: break
            
        }
    }
    
    @IBAction func clear(sender: UIButton) {
        operandStack.removeAll()
        displayValue = 0
        operationDisplay.text = ""
    }
    
    func performOperation(operate: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operate (operandStack.removeLast(),operandStack.removeLast())
        }
    }
    
    func performOperation2(operate: (Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operate (operandStack.removeLast())
        }
    }
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userIsTyping = false
        }
    }
    
    var operationDisplayValue: String {
        get {
            return operation
        }
        set {
            operationDisplay.text = "\(newValue)"
        }
    }


}