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
    var prev = 0
    var next = 0
    var operation = ""
    var isNeg = false
    var decimal = false
    
    @IBOutlet weak var numberDisplayLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numberDisplayLabel.text = "0"
    }
    
    @IBAction func clearDisplay(sender: AnyObject) {
        numberDisplayLabel.text = "0"
        decimal = false
    }
    @IBAction func operationButtonPressed(sender: UIButton) {
        decimal = false
        
    }
    @IBAction func numberButtonPressed(sender: UIButton) {
        print("\(sender)")
        
        
        let value = sender.titleLabel!.text!
        
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
        
        //get the current display
        let valueDouble = Double(numberDisplayLabel.text!) ?? 0.0
        print(valueDouble)
        
        //append the button value to display
        if (numberDisplayLabel.text!) == "0" {
            numberDisplayLabel.text! = value
        } else {
            numberDisplayLabel.text! += value
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

