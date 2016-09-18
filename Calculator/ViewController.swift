//
//  ViewController.swift
//  Calculator
//
//  Created by Linna Wang on 16/9/1.
//  Copyright © 2016年 Linna Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isNum = false
    var prev = 0.0
    var next = 0.0
    var result = 0.0
    var operation = ""
    var isNeg = false
    var decimal = false
    var new_number = true
    var pressed = false
    
    @IBOutlet weak var numberDisplayLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numberDisplayLabel.text = "0"
    }
    
    @IBAction func clearDisplay(sender: UIButton) {
        numberDisplayLabel.text = "0"
        prev = 0.0
        next = 0.0
        result = 0.0
        new_number = true
        decimal = false
        isNeg = false
        pressed = false
    }
    @IBAction func operationButtonPressed(sender: UIButton) {
        
        pressed = false
        print (operation)
        if (prev != 0.0) {
            print("prev != 0.0")
            if(operation == "÷"){
                result = Double(prev)/Double(numberDisplayLabel.text!)!
            } else if(operation == "x") {
                print (prev)
                result = (Double(numberDisplayLabel.text!)!*Double(prev))
            } else if(operation == "+") {
                result = (Double(numberDisplayLabel.text!)!+Double(prev))
            } else {
                result = Double(prev) - Double(numberDisplayLabel.text!)!
                print ("test minus:" , result)
            }
            let display = NSString(format: "%.6f", result)
            numberDisplayLabel.text = display as String
        }
        prev = Double(numberDisplayLabel.text!)!
        operation = sender.titleLabel!.text!
        do_operation(operation)
        
        
    }
    
    @IBAction func equalButtonPressed(sender: UIButton) {
        
        new_number = true
        if (pressed) {
            prev = Double(numberDisplayLabel.text!)!
        } else {
            
            //first time pressing
            next = Double(numberDisplayLabel.text!)!
            pressed = true
        }
        if(operation == "÷"){
            result = Double(prev)/next
        } else if(operation == "x") {
            result = next*Double(prev)
        } else if(operation == "+") {
            result = next+Double(prev)
        } else {
            result = Double(prev) - next
        }
        let display = NSString(format: "%.6f", result)
        print ("test precision: ", display)
        numberDisplayLabel.text = display as String
        print ("test previous:", prev, ", next: ", next, "pressed: ", pressed)
        

    }
    @IBAction func percentButtonPressed(sender: UIButton) {
        
    }
    @IBAction func numberButtonPressed(sender: UIButton) {
        
        
        let value = sender.titleLabel!.text!
        if (new_number == true) {
            numberDisplayLabel.text = "0"
        }
        new_number = false
        //to check if the neg/pos sign apply
        if value == "+/-" {
            if (numberDisplayLabel.text!) != "0" {
                if isNeg == true {
                    isNeg = false
                    let index = (numberDisplayLabel.text!).startIndex.advancedBy(1)
                    numberDisplayLabel.text! = (numberDisplayLabel.text!).substringFromIndex(index)
                } else {
                    isNeg = true
                    numberDisplayLabel.text! = "-" + numberDisplayLabel.text!
                }
            }
            return
        }
        
        
        //if the user click dot, set the boolean value to be true
        if value == "." {
            if decimal == true {
                return
            } else {
                decimal = true
                numberDisplayLabel.text! += "."
                return
            }
        }
        
        
        //if the input exceed maximum, stop
        if numberDisplayLabel.text!.characters.count >= 8 {
            return
        }
        
        //append the button value to display
        if (numberDisplayLabel.text!) == "0.0" || (numberDisplayLabel.text!) == "0" {
            numberDisplayLabel.text! = value
        } else {
            numberDisplayLabel.text! += value
        }
        
        
    }
    
    
    //helper functions for operations
    func do_operation(operation_name: String) {
        decimal = false
        new_number = true
        operation = operation_name
        
        print ("do_operation test: ", prev)
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
        
    }


}

