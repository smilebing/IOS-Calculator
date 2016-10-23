//
//  ViewController.swift
//  计算器
//
//  Created by 朱贺 on 2016/10/22.
//  Copyright © 2016年 朱贺. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var inMiddleTyping:Bool=false
    
    @IBOutlet weak var display: UILabel!
    
    @IBAction private func digitTouch( sender: UIButton) {
        let digit=sender.currentTitle!
        if inMiddleTyping{
            let currentLabelText=display!.text!
            display.text=currentLabelText+digit
        }
        else{
            display.text=digit
        }
        
        inMiddleTyping=true
        
        
    }
    
    private var displayValue:Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text=String(newValue)
        }
    }
    
    
    private var brain=CalculatorBrain()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        
        if inMiddleTyping {
            brain.setOperand(operand: displayValue)
            inMiddleTyping=false
        }
        
        
        if let mathSymbol=sender.currentTitle
        {
            brain.performOperation(symbol: mathSymbol)
        }
        
        displayValue=brain.result
    }
    
  
    
}

