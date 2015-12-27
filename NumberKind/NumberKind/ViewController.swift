//
//  ViewController.swift
//  NumberKind
//
//  Created by 堀 正洋 on 2015/12/27.
//  Copyright © 2015年 masahiro_hori. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var inputText: UITextField?
    @IBOutlet weak var outputText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        inputText?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        outputText.text = checkInputText(textField.text!)
        return true
    }
    
    func checkInputText(text: String) -> String{
        if let number = Int(text){
            if number % 2  == 0 {
                return "偶数"
            }else{
                return "奇数"
            }
        }else{
            return "エラー"
        }
    }
}

