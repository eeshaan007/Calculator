//
//  CalciBrain.swift
//  Eeshaan_Calculator
//
//  Created by Guest User on 2018-10-02.
//  Copyright © 2018 Guest User. All rights reserved.
//

import Foundation

func power2 (_ op1:Double) -> Double {
    
    return pow(op1, 2)
    
}

func changesign (_ op1:Double) -> Double {
    
    return -op1
    
}
func divisionByX (_ op1:Double) -> Double {
    
    return 1/op1
    
}
func factorial(_ factorialNumber: Double) -> Double {
    if factorialNumber == 0 {
        return 1
    } else if factorialNumber > 0 {
        return factorialNumber * factorial(factorialNumber - 1)
    } else {
        return 0
    }
}
func logarithm(_ op1: Double) -> Double {
    
    return log10(op1)
    
}
func multiply(_ op1: Double,_ op2: Double) -> Double {
    return op1 * op2
}
func addition(_ op1: Double,_ op2: Double) -> Double {
    return op1 + op2
}
func subtraction(_ op1: Double,_ op2: Double) -> Double {
    return op1 - op2
}
func division(_ op1: Double,_ op2: Double) -> Double {
    return op1 * op2
}

struct calcibrain {
    
    mutating func performOperation(_ symbol: String){
        
        if let operation = Operations[symbol]{
            switch operation {
            case.constant(let value):
                accumulator = value
            case.unaryOperation(let function):
                if accumulator != nil{
                    accumulator = function(accumulator!)
                    
                }
           case.binaryOperation(let function):
            if accumulator != nil {
            pendingBinaryOperation = PendingBinaryOperation(function: function, firstOperand: accumulator!)
                accumulator = nil}
                
            case .equals:
                performPendingBinaryOperation()
            }
        }
    }
    
    mutating func performPendingBinaryOperation() {
        
        if pendingBinaryOperation != nil && accumulator != nil {
            accumulator = pendingBinaryOperation?.perform(with: accumulator!)
        }
        
    }
    
    private var pendingBinaryOperation: PendingBinaryOperation?
    
    private struct PendingBinaryOperation {
        
        let function: (Double, Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            
            return function(firstOperand, secondOperand)
            
        }
        
    }
    

    
    private var accumulator: Double?
    
    private enum Operation{
        
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double,Double) -> Double)
        case equals
        
    }
    
    private var Operations: Dictionary<String,Operation> = [
    
        "π" : Operation.constant(Double.pi),
        "e" : Operation.constant(M_E),
        "√" : Operation.unaryOperation(sqrt),
        "cos" : Operation.unaryOperation(cos),
        "∓" : Operation.unaryOperation(changesign),
        "sin" : Operation.unaryOperation(sin),
        "tan" : Operation.unaryOperation(tan),
        "x²" : Operation.unaryOperation(power2),
        "1/x" : Operation.unaryOperation(divisionByX),
        "!" : Operation.unaryOperation(factorial),
        "log" : Operation.unaryOperation(logarithm),
        "+" : Operation.binaryOperation(addition),
        "-" : Operation.binaryOperation(subtraction),
        "/" : Operation.binaryOperation(division),
        "x" : Operation.binaryOperation(multiply),
        "=" : Operation.equals
        
       // "*":Operation.binaryOperation(multiply),
      //  "=":Operation.equals
    ]
    
   
    
    mutating func setOperand(_ operand:Double){
        
        accumulator = operand
        
    }
    
    
    
    
    var result: Double? {
       
        get{
            return accumulator
        }
        
        }

    }
    


