//
//  ViewController.swift
//  CurrencyExchange
//
//  Created by 堀 正洋 on 2015/12/31.
//  Copyright © 2015年 masahiro_hori. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var inputText: UITextField?
    @IBOutlet weak var outputText: UILabel!
    @IBOutlet weak var outputcurrency: UILabel!
    
    var money: Money!
    var currency: String!
    var convertMoney: Money!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.inputText?.delegate = self
        money = Money()
        money.setCurrency("USD")
        convertMoney = Yen()
        convertMoney.setCurrency("YEN")
        currency = "YEN"
        outputcurrency.text = currency
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        
        textField.resignFirstResponder()
        
        if let amount = Int((textField.text)!){
            
            money.setAmount(Double(amount))
            outputText.text = money.convert(convertMoney).displayAmount()
            
        }else{
            outputText.text = "エラー"
        }
        return true
    }
    
    @IBAction func doCnversionEUR(sender: UIButton) {
        currency = "EUR"
        outputcurrency.text = currency
        convertMoney = Euro()
        convertMoney.setCurrency(currency)
    }
    

    @IBAction func doCnversionYEN(sender: UIButton) {
        currency = "YEN"
        outputcurrency.text = currency
        convertMoney = Yen()
        convertMoney.setCurrency(currency)
    }


    
    class Money{
        var amount: Double = 0
        var currency: String = ""
        var rates: Dictionary<String, Double> = ["USDYEN":120, "USDEUR":1.2]
        
        func setAmount(inputMoeny: Double){
            amount = inputMoeny
        }
        
        func setCurrency(cur: String){
            currency = cur
        }
        
        func convert(convertMoney: Money) -> Money{
            convertMoney.setAmount(amount*rates[currency+convertMoney.currency]!)
            return convertMoney
        }
        
        func getAmount() -> Double{
            return amount
        }
        
        func displayAmount() -> String{
            return ""
        }
    }
    
    class Yen: Money{
        override func displayAmount() -> String {
            return String(format: "%.0f", amount)
        }
    }
    
    class Euro: Money{
        override func displayAmount() -> String {
            return String(format: "%.2f", amount)
        }
    }
}