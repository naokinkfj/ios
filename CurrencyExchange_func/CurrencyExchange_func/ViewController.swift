//
//  ViewController.swift
//  CurrencyExchange_func
//
//  Created by 堀 正洋 on 2016/01/01.
//  Copyright © 2016年 masahiro_hori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputText: UILabel!
    @IBOutlet weak var outputCurrency: UILabel!
    
    @IBOutlet weak var buttonYEN: UIButton!
    @IBOutlet weak var buttonEUR: UIButton!
    
    var currency: String!
    var inputTexts = [1,5,10,20,50,100]
    
    var rates: Dictionary<String, Double> = ["USDYEN":120, "USDEUR":1.2]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doConversionYEN(sender: UIButton) {
        currency = buttonYEN.titleLabel?.text
        doConversion()
    }

    @IBAction func doConversionEUR(sender: UIButton) {
        currency = buttonEUR.titleLabel?.text
        doConversion()
    }
    
    func doConversion(){
        outputCurrency.text = currency
        let convertYEN = convert(currency)
        outputText.text = convertYEN(inputTexts[0]) + " "
            + convertYEN(inputTexts[1]) + " "
            + convertYEN(inputTexts[2]) + " "
            + convertYEN(inputTexts[3]) + " "
            + convertYEN(inputTexts[4]) + " "
            + convertYEN(inputTexts[5])
    }
    
    func convert(cur: String) -> (Int -> String){
    
        func convertY(inpch: Int) -> String {
            return String(format: "%.0f", Double(inpch) * rates["USDYEN"]!)
        }
        func convertE(inpch: Int) -> String {
            return String(format: "%.2f", Double(inpch) * rates["USDEUR"]!)
        }
        
        if cur == "YEN" {
            return convertY
        } else {
            return convertE
        }
    }
}

