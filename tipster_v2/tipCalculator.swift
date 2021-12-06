//
//  tipCalculator.swift
//  tipster_v2
//
//  Created by Hajar Alomari on 05/12/2021.
//

import Foundation

struct tipCalculator{
    
    var bill: Double
    var tip: Double
    var groupSize: Double
    
    init(bill: Double, tip: Double, groupSize: Double){
        self.bill = bill
        self.tip = tip
        self.groupSize = groupSize
    }
    
    func calculateTip() -> (totalTip: Double , SingularTip: Double){
       
        let tipValue = bill * (tip/100)
        let tipForSinglePerson = tipValue / groupSize
        return (tipValue , tipForSinglePerson)
    }
    
    func calculateBill() -> Double {
        let totalBill = (calculateTip().totalTip + bill) / groupSize
        return totalBill
    }
    
    
}
