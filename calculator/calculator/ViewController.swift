//
//  ViewController.swift
//  calculator
//
//  Created by Quan Trinh on 2019-04-10.
//  Copyright © 2019 Quan Trinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isPristine : Bool = true
    var previousNumber : Double = 0
    var isPerformingMath : Bool = false
    var holder : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var display: UILabel!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func number(_ sender: UIButton) {
        isPerformingMath = false
        if isPristine && sender.tag != 0{
            holder = holder + String(sender.tag)
            display.text = ""
            display.text = display.text! + String(sender.tag)
            isPristine = false
        }
        else {
            display.text = display.text! + String(sender.tag)
        }
        
        holder = holder + String(sender.tag)
    }
    
    @IBAction func performMath(_ sender: UIButton) {
        let operand = getOperand(sender.tag)
        if !isPristine && !isPerformingMath {
            calculate(holder)
            holder = ""
            if operand != "" {
                display.text = display.text! + operand
            }
        }
    }
    
    func calculate(_ holder : String){
        
    }
    
    func getOperand(_ tag : Int) -> String {
        switch (tag) {
        case 11 : return "/"
        case 12 : return "x"
        case 13 : return "+"
        case 14 : return "-"
        default:
            print("Logic Error: A Button which is not operand has been assigned to this action")
            return ""
        }
    }
    
    @IBAction func clear(_ sender: UIButton) {
        isPristine = true
        previousNumber = 0
        display.text = "0"
        result.text = "0"
        holder = ""
        isPerformingMath = false
    }
    
}

