//
//  ViewController.swift
//  计算器
//
//  Created by 朱贺 on 2016/10/22.
//  Copyright © 2016年 朱贺. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var inMiddleTyping:Bool=false
    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func digitTouch( sender: UIButton) {
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
    
    var displayValue:Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text=String(newValue)
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        inMiddleTyping=false
        
        if let mathSymbol=sender.currentTitle
        {
            if mathSymbol=="∏"{
                displayValue=M_PI
            }else if mathSymbol=="√"{
                displayValue = sqrt(displayValue)
            }
        }
    }
    
    func test(a:Int)->Int{
        return a
    }
    
}

