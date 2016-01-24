//
//  ViewController.swift
//  NSUserDefaultsSample
//
//  Created by 堀 正洋 on 2016/01/17.
//  Copyright © 2016年 masahiro_hori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var udLabel: UILabel!
    @IBOutlet weak var udField: UITextField!
    
    var udText :String = ""
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let tmpUdText = userDefaults.objectForKey("UD") {
            udText = tmpUdText as! String
        }else{
            udText = "未設定"
        }
        
        udLabel.text = udText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func udChangeButton(sender: UIButton) {
        
        let inputUdField  = udField.text
        
        userDefaults.setObject(inputUdField, forKey: "UD")
        userDefaults.synchronize()
        
        udText = userDefaults.objectForKey("UD") as! String
        
        udLabel.text = udText
    }

    
    @IBAction func udDeleteButton(sender: UIButton) {
        
        userDefaults.removeObjectForKey("UD")
        
        udLabel.text = "削除しました。"
    }
}