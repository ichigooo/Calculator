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
        operation = ""
        new_number = true
        decimal = false
        isNeg = false
        pressed = false
    }
    @IBAction func operationButtonPressed(sender: UIButton) {
        print ("test operation")
        pressed = false

        if (prev != 0.0) {
            if(operation == "÷"){
                result = Double(prev)/Double(numberDisplayLabel.text!)!
            } else if(operation == "x") {
                result = (Double(numberDisplayLabel.text!)!*Double(prev))
            } else if(operation == "+") {
                result = (Double(numberDisplayLabel.text!)!+Double(prev))
            } else {
                result = Double(prev) - Double(numberDisplayLabel.text!)!
            }
            var on_display = String(format: "%g", result)
            if String(result).characters.count >= 8 {
                let index = (String(result)).startIndex.advancedBy(8)
                on_display = (String(result)).substringToIndex(index)
            }
            numberDisplayLabel.text = on_display
        }
        prev = Double(numberDisplayLabel.text!)!
        isNeg = false
        operation = sender.titleLabel!.text!
        do_operation(operation)
        
        
        
    }
    
    @IBAction func equalButtonPressed(sender: UIButton) {
        if (operation == "") {
            return
        }
        isNeg = false
        new_number = true
        print ("test")
        
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
//        let display = NSString(format: "%.6f", result)
//        print ("test precision: ", display)
//        numberDisplayLabel.text = display as String
        var on_display = String(format: "%g", result)
        if String(result).characters.count >= 8 {
            let index = (String(result)).startIndex.advancedBy(8)
            on_display = (String(result)).substringToIndex(index)
        }
        print ("test here", on_display)
        numberDisplayLabel.text = on_display

    }
    @IBAction func percentButtonPressed(sender: UIButton) {
        var on_display = numberDisplayLabel.text!
        on_display = String(Double(on_display)!*0.01)
        if on_display.characters.count >= 8 {
            let index = on_display.startIndex.advancedBy(8)
            on_display = on_display.substringToIndex(index)
        }
        numberDisplayLabel.text = on_display
        
    }
    @IBAction func numberButtonPressed(sender: UIButton) {
        print ("test number")
        
        let value = sender.titleLabel!.text!
        if (new_number == true) {
            numberDisplayLabel.text = "0"
        }
        new_number = false
        //to check if the neg/pos sign apply
        
        if value == "+/-" {
            
            if isNeg == true {
                isNeg = false
                let index = (numberDisplayLabel.text!).startIndex.advancedBy(1)
                numberDisplayLabel.text! = (numberDisplayLabel.text!).substringFromIndex(index)
            } else {
                isNeg = true
                if (numberDisplayLabel.text!) != "0.0" && (numberDisplayLabel.text!) != "0" {
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
        } else if (numberDisplayLabel.text!) == "-0"{
            numberDisplayLabel.text! = "-" + value
        } else {
            numberDisplayLabel.text! += value
        }
        
        
    }
    
    
    //helper functions for operations
    func do_operation(operation_name: String) {
        decimal = false
        new_number = true
        operation = operation_name
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
        
    }


}

