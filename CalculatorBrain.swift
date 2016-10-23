//
//  CalculatorBrain.swift
//  计算器
//
//  Created by 朱贺 on 2016/10/23.
//  Copyright © 2016年 朱贺. All rights reserved.
//

import Foundation

class CalculatorBrain{
    
    private var accumulator=0.0
    
    var result:Double{
        get{
            return accumulator
        }
    }
    
    func setOperand(operand:Double){
        accumulator=operand
    }
    
    enum operation {
        case constant(Double)
        case UnaryOperation((Double)->Double)
        case BinaryOperation
        case Equals
    }
    
    var operations:Dictionary<String,operation>=[
        "∏":operation.constant(M_PI),
        "e":operation.constant(M_E),
        "cos":operation.UnaryOperation(cos),
        "√":operation.UnaryOperation(sqrt)
    ]
    
    func performOperation(symbol:String){
        if let operation=operations[symbol]{
            switch operation {
            case .constant(let associatedConstantValue):
                accumulator=associatedConstantValue
                
            case .UnaryOperation(let function):
                accumulator=function(accumulator)
                
            case .BinaryOperation:
                break
                
            case .Equals:
                break
            
            }
        }
    }
}
