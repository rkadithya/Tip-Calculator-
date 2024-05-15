//
//  calculateTips.swift
//  Tips Calculator
//
//  Created by Adithya on 13/05/24.
//

import Foundation

struct CalculateTips{
    var tip : Double = 0.0
    var people:Int = 2
    var totalBill : Double = 0.0
    func getTip(){
        
        
    }
    
    
    mutating func calculte(_ tips:String){
        
        self.tip = (Double(tips)!/100)
        
    }
    
    func getTipsValue() -> Int{
        
        return Int(tip*100)
    }
    
    
    mutating func numberOfPeople(_ peopleCount:Int) -> Int{
        self.people = peopleCount
        return peopleCount
    }
    
    mutating func getTheBill(_ bill:String){
        if bill != ""{
            let billTotal = Double(bill)
            self.totalBill = billTotal!
        }
    }
    
    
    func calculateResult() ->String{
        
        let result = totalBill * (1 + tip) / Double(people)
        let finalResult = String(format: "%.2f ",result)
        
        return finalResult
    }
    
    
    
}
