//
//  ViewController.swift
//  Eeshaan_Calculator
//
//  Created by Guest User on 2018-09-18.
//  Copyright © 2018 Guest User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
        var userIsInTheMiddleofTyping = false
   
    @IBAction func buttonDigit(_ sender: UIButton) {
        
        let digit = sender.currentTitle!
        let textCurrentlyInDisplay = display.text!
        
        if userIsInTheMiddleofTyping{
            
            display.text = textCurrentlyInDisplay + digit
        }
        else {
            display.text = digit
            userIsInTheMiddleofTyping = true
        }
    }
    
    var displayValue: Double{
        
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
        
    }
    
    private var brain = calcibrain()
    
    @IBAction func performOperation(_ sender: UIButton){
        
        if userIsInTheMiddleofTyping{
            brain.setOperand(displayValue)
            userIsInTheMiddleofTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle{
            brain.performOperation(mathematicalSymbol)
        }
        if let result = brain.result
        {
            displayValue = result
        }
        
    }
    
    
 /*   @IBAction func performOperation(_ sender: UIButton) {
        
        userIsInTheMiddleofTyping = false
        if let mathematicalSymbol = sender.currentTitle
        {
            switch mathematicalSymbol {
            case "π":
                //display.text! = String(Double.pi)
                displayValue = Double.pi
                
            case "√":
                //let operand = Double(display.text!)!
               // display.text = String(sqrt(operand))
                displayValue = sqrt(displayValue)
            default: break
                
            }
        }
    } */
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    }

    
    
    
    
    
    
    
    
    
    
    




