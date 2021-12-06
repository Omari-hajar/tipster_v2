//
//  ViewController.swift
//  tipster_v2
//
//  Created by Hajar Alomari on 05/12/2021.
//

import UIKit

class ViewController: UIViewController {
    //delcare UI elements
    @IBOutlet weak var billLabel: UILabel!
    
    //percentage labels
    @IBOutlet weak var percentLabelLow: UILabel!
    @IBOutlet weak var percentLabelMid: UILabel!
    @IBOutlet weak var percentLabelHigh: UILabel!
    
    //tip amounts labels
    
    @IBOutlet weak var tipLabelLow: UILabel!
    @IBOutlet weak var tipLabelMid: UILabel!
    @IBOutlet weak var tipLabelHigh: UILabel!
    
    //total bill amount labels
    
    @IBOutlet weak var totalBillLabelLow: UILabel!
    @IBOutlet weak var totalBillLabelMid: UILabel!
    @IBOutlet weak var totalBillLabelHigh: UILabel!
    
    //slider
    @IBOutlet weak var tipSlider: UISlider!
    
    @IBOutlet weak var groupSizeSlider: UISlider!
    @IBOutlet weak var groupSizeLabel: UILabel!
    
    
    //declare variables
    
    var billLabelValue: String = ""
    var billLabelInDouble: Double = 0.0
    
    var tipValue: Double = 0.0
    var tipValueMid: Double = 0.0
    var tipValueHi: Double = 0.0
    
    var groupSizeValue: Double = 1.0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //clear bill label action
    @IBAction func clearAmountBtn(_ sender: UIButton) {
        billLabelValue = ""
        billLabel.text = billLabelValue
        percentLabelLow.text = "5%"
        tipLabelLow.text = "0"
        totalBillLabelLow.text = "0"
        
        percentLabelMid.text = "10%"
        tipLabelMid.text = "0"
        totalBillLabelMid.text = "0"
        
        percentLabelHigh.text = "15%"
        tipLabelHigh.text = "0"
        totalBillLabelHigh.text = "0"
    }
    
    //number input action
    @IBAction func NumberBtnPressed(_ sender: UIButton) {
        billLabelValue += sender.currentTitle ?? ""
        billLabel.text = billLabelValue
        
    }
    
    //tip slider action
    
    @IBAction func tipSlider(_ sender: UISlider) {
        sender.minimumValue = 5
        sender.maximumValue = 100
        
        tipValue = round(Double(sender.value))
        tipValueMid = tipValue + 5.0
        tipValueHi = tipValue + 10.0
        
        //low percent
       billLabelInDouble = stringToDoubleConverter(value: billLabelValue)
        let bill = findAndDisplayValues(bill: billLabelInDouble, tip: tipValue, group: groupSizeValue)
        percentLabelLow.text = "\(tipValue)%"
        tipLabelLow.text = bill.tipPerPersong
        totalBillLabelLow.text = bill.total

        //Mid percent
        let billMid = findAndDisplayValues(bill: billLabelInDouble, tip: tipValueMid, group: groupSizeValue)
        percentLabelMid.text = "\(tipValueMid)%"
        tipLabelMid.text = billMid.tipPerPersong
        totalBillLabelMid.text = billMid.total
        
        // High Percent
        
        let billHigh = findAndDisplayValues(bill: billLabelInDouble, tip: tipValueHi, group: groupSizeValue)
        percentLabelHigh.text = "\(tipValueHi)%"
        tipLabelHigh.text = billHigh.tipPerPersong
        totalBillLabelHigh.text = billHigh.total
        
    }
    
    //group slider action
    
    @IBAction func groupSizeSlider(_ sender: UISlider) {
        sender.minimumValue = 1
        groupSizeValue = round(Double(sender.value))
       
        groupSizeLabel.text = "group Size :  \(stringDoubleFromater(value: groupSizeValue, places: 0))"
        
        //low percent
       billLabelInDouble = stringToDoubleConverter(value: billLabelValue)
        let bill = findAndDisplayValues(bill: billLabelInDouble, tip: tipValue, group: groupSizeValue)
        percentLabelLow.text = "\(tipValue)%"
        tipLabelLow.text = bill.tipPerPersong
        totalBillLabelLow.text = bill.total

        //Mid percent
        let billMid = findAndDisplayValues(bill: billLabelInDouble, tip: tipValueMid, group: groupSizeValue)
        percentLabelMid.text = "\(tipValueMid)%"
        tipLabelMid.text = billMid.tipPerPersong
        totalBillLabelMid.text = billMid.total
        
        // High Percent
        
        let billHigh = findAndDisplayValues(bill: billLabelInDouble, tip: tipValueHi, group: groupSizeValue)
        percentLabelHigh.text = "\(tipValueHi)%"
        tipLabelHigh.text = billHigh.tipPerPersong
        totalBillLabelHigh.text = billHigh.total
    }
    
}

func stringDoubleFromater(value:Double, places: Int) -> String{
return String(format: "%.\(places)f", value)
}

func stringToDoubleConverter (value: String) -> Double {
    return (value as NSString).doubleValue
}

func findAndDisplayValues(bill: Double, tip: Double , group: Double) -> (total: String, tipPerPersong: String){
    let calculate = tipCalculator(bill: bill, tip: tip, groupSize: group)
    let totalBill = stringDoubleFromater(value: calculate.calculateBill(), places: 2)
    let tipPerPerson = stringDoubleFromater(value: calculate.calculateTip().SingularTip, places: 2)
    return (totalBill , tipPerPerson)
    
}



