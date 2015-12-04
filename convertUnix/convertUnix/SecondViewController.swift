//
//  SecondViewController.swift
//  convertUnix
//
//  Created by 堀 正洋 on 2015/12/04.
//  Copyright © 2015年 masahiro_hori. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var dataTextField: UITextField!
    
    // AppDelegateにアクセスするオブジェクトを作成します。
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
        // キーボードを閉じます。
        dataTextField.resignFirstResponder()
        
        if let text = dataTextField.text{
            if let inchValue = Double(text){
                ap.cmValue = inchValue / 0.3937
            }
        }
    }
    
    // この画面が標示される時に呼び出されます。
    override func viewWillAppear(animated: Bool) {
        // 共有変数の値をフィールドに設定します。
        let inchValue = ap.cmValue * 0.3937
        dataTextField.text = String(inchValue)
    }
}

