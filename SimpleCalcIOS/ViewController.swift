//
//  ViewController.swift
//  SimpleCalcIOS
//
//  Created by Xiangyu Ju on 15/10/22.
//  Copyright © 2015年 Xiangyu Ju. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numbers: [String] = [""]
    
    var operation: String = "+"
    
    var rpn: Bool = false
    
    var result: Double = 0.0
    
    // String -> Double
    func convertDouble(incoming: String) -> Double {
        
        return NSNumberFormatter().numberFromString(incoming)!.doubleValue
        
    }
    
    //calculation
    func calc(var numbers: [String], operation: String) -> String{
        
        result = 0.0
        
        switch operation {
            
        case "+":
            
            for index in 0...numbers.count-1{
                
                result = result + convertDouble(numbers[index])
                
            }
            
        case "-":
            
            result = convertDouble(numbers[0])
            
            for index in 1...numbers.count-1{
                
                result = result - convertDouble(numbers[index])
            }
            
        case "*":
            
            result = 1.0
            
            for index in 0...numbers.count-1{
                
                result = result * convertDouble(numbers[index])
            }
            
        case "/":
            
            result = convertDouble(numbers[0])
            
            for index in 1...numbers.count-1{
                
                result = result / convertDouble(numbers[index])
            }
            
        case "Mod":
            
            result = convertDouble(numbers[0])
            
            for index in 1...numbers.count-1{
                
                result = result % convertDouble(numbers[index])
            }
            
        case "Count":
            
            result = Double(numbers.count)
            
        case "Avg":
            
            for index in 0...numbers.count-1{
                
                result = result + convertDouble(numbers[index])
            }
            
            result = result / Double(numbers.count)
            
        default:
            
            result = 0.0
        }
        
        return String(result)
    }
    
    // Click "RPN" Button
    @IBAction func buttonRPN(sender: UIButton) {
        
        rpn = !rpn
        
        if rpn {
            
            text.text = "Open RPN Functionality."
            
        } else {
            
            text.text = "Open Traditional Functionality."
        }
        
        numbers = [""]
    }
    
    // Click "." Button
    @IBAction func buttonDot(sender: UIButton) {
        
        if text.text != operation {
            
            numbers[numbers.count-1] = numbers[numbers.count-1] + "."
            
        } else {
            
            numbers.append(".")
        }
        
        text.text = numbers[numbers.count-1]
    }
    
    // Click "Enter" Button
    @IBAction func buttonEnter(sender: UIButton) {
        
        if rpn {
            
            numbers.append("")
            
        }

    }
    
    // Click "Fact" Button
    @IBAction func buttonFact(sender: UIButton) {
        
        var factResult: Double = 1.0
        
        operation = "Fact"
        
        let number = Int(convertDouble(numbers[numbers.count-1]))
        
        if number < 0 {
            
            text.text = "Please enter a nonnegative number!"
            
        } else if number == 0 {
            
            text.text = "1"
            
        } else {
            
            for index in 1...number {
                
                factResult = factResult * Double(index)
            }
            
            numbers = [String(factResult)]
            
            text.text = String(factResult)
        }
        
    }
    
    // Click "Avg" Button
    @IBAction func buttonAvg(sender: UIButton) {
        
        operation = "Avg"
        
        if rpn {
            
            text.text = calc(numbers, operation: operation)
            
            numbers = [String(result)]
            
        } else {
            
            text.text = operation
            
        }
    }
    
    // Click "Count" Button
    @IBAction func buttonCount(sender: UIButton) {
        
        operation = "Count"
        
        if rpn {
            
            text.text = calc(numbers, operation: operation)
            
            numbers = [String(result)]
            
        } else{
            
            text.text = operation
            
        }
    }
    
    // Click "Mod" Button
    @IBAction func buttonMod(sender: UIButton) {
        
        operation = "Mod"
        
        if rpn {
            
            text.text = calc(numbers, operation: operation)
            
            numbers = [String(result)]
            
        } else {
            
            text.text = operation
            
        }
    }
    
    // Click "/" Button
    @IBAction func buttonDiv(sender: UIButton) {
        
        operation = "/"
        
        if rpn {
            
            text.text = calc(numbers, operation: operation)
            
            numbers = [String(result)]
            
        } else {
            
            text.text = operation
            
        }
    }
    
    // Click "*" Button
    @IBAction func buttonMul(sender: UIButton) {
        
        operation = "*"
        
        if rpn {
            
            text.text = calc(numbers, operation: operation)
            
            numbers = [String(result)]
            
        } else {
            
            text.text = operation
            
        }
    }
    
    // Click "-" Button
    @IBAction func buttonSub(sender: UIButton) {
        
        if numbers[numbers.count-1] == "" {
            
            numbers[numbers.count-1] = "-"
            
            text.text = numbers[numbers.count-1]
            
        } else {
            
            operation = "-"
            
            if rpn {
                
                text.text = calc(numbers, operation: operation)
                
                numbers = [String(result)]
                
            } else {
                
                text.text = operation
                
            }
        }
    }
    
    // Click "+" Button
    @IBAction func buttonAdd(sender: UIButton) {
    
        operation = "+"
        
        if rpn {
            
            text.text = calc(numbers, operation: operation)
            
            numbers = [String(result)]
            
        } else {
            
            text.text = operation
            
        }
        
    }
    
    // Click "=" Button
    @IBAction func buttonEqual(sender: UIButton) {
        
        text.text = calc(numbers, operation: operation)
        
        numbers = [String(result)]
        
    }
    
    // Click "AC" Button
    @IBAction func buttonAC(sender: UIButton) {
        
        numbers = [""]
        
        operation = "+"
        
        text.text = ""
        
        //result = 0.0

    }
    
    // Click "9" Button
    @IBAction func button9(sender: UIButton) {
        
        if text.text != operation {
            
            numbers[numbers.count-1] = numbers[numbers.count-1] + "9"
            
        } else {
            
            numbers.append("9")
        }
        
        text.text = numbers[numbers.count-1]
        
    }
    
    // Click "8" Button
    @IBAction func button8(sender: UIButton) {
        
        if text.text != operation {
            
            numbers[numbers.count-1] = numbers[numbers.count-1] + "8"
            
        } else {
            
            numbers.append("8")
        }
        
        text.text = numbers[numbers.count-1]
    }
    
    // Click "7" Button
    @IBAction func button7(sender: UIButton) {
        
        if text.text != operation {
            
            numbers[numbers.count-1] = numbers[numbers.count-1] + "7"
            
        } else {
            
            numbers.append("7")
        }
        
        text.text = numbers[numbers.count-1]
    }
    
    // Click "6" Button
    @IBAction func button6(sender: UIButton) {
        
        if text.text != operation {
            
            numbers[numbers.count-1] = numbers[numbers.count-1] + "6"
            
        } else {
            
            numbers.append("6")
        }
        
        text.text = numbers[numbers.count-1]
    }
    
    // Click "5" Button
    @IBAction func button5(sender: UIButton) {
        
        if text.text != operation {
            
            numbers[numbers.count-1] = numbers[numbers.count-1] + "5"
            
        } else {
            
            numbers.append("5")
        }
        
        text.text = numbers[numbers.count-1]
    }
    
    // Click "4" Button
    @IBAction func button4(sender: UIButton) {
        
        if text.text != operation {
            
            numbers[numbers.count-1] = numbers[numbers.count-1] + "4"
            
        } else {
            
            numbers.append("4")
        }
        
        text.text = numbers[numbers.count-1]
    }
    
    // Click "3" Button
    @IBAction func button3(sender: UIButton) {
        
        if text.text != operation {
            
            numbers[numbers.count-1] = numbers[numbers.count-1] + "3"
            
        } else {
            
            numbers.append("3")
        }
        
        text.text = numbers[numbers.count-1]
    }
    
    // Click "2" Button
    @IBAction func button2(sender: UIButton) {
        
        if text.text != operation {
            
            numbers[numbers.count-1] = numbers[numbers.count-1] + "2"
            
        } else {
            
            numbers.append("2")
        }
        
        text.text = numbers[numbers.count-1]
    }
    
    // Click "1" Button
    @IBAction func button1(sender: UIButton) {
        
        if text.text != operation {
            
            numbers[numbers.count-1] = numbers[numbers.count-1] + "1"
            
        } else {
            
            numbers.append("1")
        }
        
        text.text = numbers[numbers.count-1]
    }
    
    // Click "0" Button
    @IBAction func button0(sender: UIButton) {
        
        if text.text != operation {
            
            numbers[numbers.count-1] = numbers[numbers.count-1] + "0"
            
        } else {
            
            numbers.append("0")
        }
        
        text.text = numbers[numbers.count-1]

    }
    
    //text
    @IBOutlet weak var text: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

