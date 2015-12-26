//
//  ViewController.swift
//  dogMan
//
//  Created by 堀 正洋 on 2015/12/26.
//  Copyright © 2015年 masahiro_hori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dogAge: UITextField!
    @IBOutlet weak var result: UILabel!
    
    @IBAction func tapChangeAge(sender: AnyObject) {
        
        if self.dogAge.text != nil {
            let dogAgeInt = Int(self.dogAge.text!)
            var tempAge: Int = 0
            
            if dogAgeInt == 1 {
                tempAge = 12
            }else if dogAgeInt == 2 {
                tempAge = 24
            }else{
                tempAge = 24 + (dogAgeInt!-2)*4
            
            }
            
            self.result.text = "人間の年だと\(tempAge)歳です。"
        }else{
            self.result.text = "数字を入力してください。"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

