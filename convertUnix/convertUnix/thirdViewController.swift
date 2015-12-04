//
//  thirdViewController.swift
//  convertUnix
//
//  Created by 堀 正洋 on 2015/12/04.
//  Copyright © 2015年 masahiro_hori. All rights reserved.
//

import UIKit

class thirdViewController: UIViewController {

    @IBOutlet weak var dataTextField: UITextField!
    
    // AppDelegeteにアクセスするオブジェクトを作成します。
    let ap = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func tapInput(sender: AnyObject) {
        dataTextField.resignFirstResponder()
        
        if let text = dataTextField.text{
            if let sunValue = Double(text){
                ap.cmValue = sunValue / 0.33
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        let sunValue = ap.cmValue * 0.33
        dataTextField.text = String(sunValue)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
