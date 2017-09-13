//
//  ViewController.swift
//  Calculator
//
//  Created by Nathan Foster on 08/29/2017.
//  Copyright © 2017 Nathan Foster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // Connect the view with the controller
    private var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var display: UILabel!
    
    // Display the text of the button that is pressed
    var displayValue: Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    // Variables that listen for input
    var isTypingDigit = false, decimalIsTouched = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        sender.layer.borderColor = UIColor.white.cgColor
        
        let displayText = display.text!
        
        var touchedDigit = String()
        
        let whatIsTouched = sender.currentTitle!
        
        if decimalIsTouched==false && whatIsTouched=="."{
            decimalIsTouched = true
            touchedDigit = whatIsTouched
        }else if decimalIsTouched==true && whatIsTouched=="."{
            touchedDigit = ""
        }else{
            touchedDigit = whatIsTouched
        }
        
        if isTypingDigit{
            display.text = displayText + touchedDigit
        }else{
            display.text = touchedDigit
        }
        
        isTypingDigit = true
        
    }
    
    // Determine which button operation is being pressed
    @IBAction func preformOperation(_ sender: UIButton) {
        decimalIsTouched = false
        
        if isTypingDigit{
            calculatorBrain.setOperand(displayValue)
            isTypingDigit = false
        }
        
        if let mathematicalSymbol = sender.currentTitle{
            calculatorBrain.preformOperation(mathematicalSymbol)
        }
        
        displayValue = calculatorBrain.result
    }
}

