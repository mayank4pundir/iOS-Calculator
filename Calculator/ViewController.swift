//
//  ViewController.swift
//  Calculator
//
//  Created by DevRonins on 22/02/22.
//

import UIKit

enum Operation: String {
    case Add = "+"
    case Sub = "-"
    case Mul = "*"
    case Div = "/"
    case NULL = "NULL"
}

class ViewController: UIViewController {
    
    @IBOutlet var outputLabel: UILabel!
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation: Operation = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputLabel.text = "0"
    }

    
    @IBAction func numberPressed(_ sender: Any) {
        
        if (runningNumber.count <= 9) {
            runningNumber += "\((sender as AnyObject).tag!)"
            outputLabel.text = runningNumber
        }
        
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .NULL
        outputLabel.text = "0"
    }
    
    @IBAction func addPressed(_ sender: Any) {
        operation(operation: .Add)
    }
    
    @IBAction func subtractPressed(_ sender: Any) {
        operation(operation: .Sub)
    }
    
    @IBAction func multiplyPressed(_ sender: Any) {
        operation(operation: .Mul)
    }
    
    @IBAction func dividePressed(_ sender: Any) {
        operation(operation: .Div)
    }
    
    //method to print result
    @IBAction func ResultPressed(_ sender: Any) {
        operation(operation: currentOperation)
    }
    
    //Opeartions Function
    func operation(operation: Operation) {
        
        if currentOperation != .NULL {
            
            if runningNumber != "" {
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add {
                    result = "\( Double(leftValue)! + Double(rightValue)! )"
                }
                else if currentOperation == .Sub {
                    result = "\( Double(leftValue)! - Double(rightValue)! )"
                }
                else if currentOperation == .Mul {
                    result = "\( Double(leftValue)! * Double(rightValue)! )"
                }
                else if currentOperation == .Div {
                    result = "\( Double(leftValue)! / Double(rightValue)! )"
                }
                leftValue = result
                //If result value is divide by 1 and we get remainder is 0 then, we convert double value to int and show to display
                if( Double(result)!.truncatingRemainder(dividingBy: 1) == 0 ) {
                    result = "\( Int( Double(result)! ) )"
                }
                outputLabel.text = result
            } //if runn num Empty end
            currentOperation = operation
            
        }else{
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }//if to check null operation
    }
    
}
