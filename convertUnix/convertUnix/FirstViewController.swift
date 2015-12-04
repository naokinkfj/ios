//
//  FirstViewController.swift
//  convertUnix
//
//  Created by 堀 正洋 on 2015/12/04.
//  Copyright © 2015年 masahiro_hori. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var dataTextField: UITextField!
    
    // AppDelegateにアクセスするオブジェクトを作ります
    let ap = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapInput(sender: AnyObject) {
        // キーボードを閉じます
        dataTextField.resignFirstResponder()
        
        if let text = dataTextField.text{
            // テキストフィールドに値があって
            if let cmValue = Double(text){
                // 少数の値に変換できたら、共有変数に書き込みます。
                ap.cmValue = cmValue
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        dataTextField.text = String(ap.cmValue)
    }

}

