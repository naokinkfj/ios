//
//  ViewController.swift
//  AlertSample
//
//  Created by 堀 正洋 on 2016/01/19.
//  Copyright © 2016年 masahiro_hori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func alertButton1(sender: UIButton) {
        let alertController = UIAlertController(title: "Hello", message: "This is Alert", preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alertController.addAction(defaultAction)
        
        self.presentViewController(alertController,animated: true, completion: nil)
    }

    @IBAction func alertButton2(sender: UIButton) {
        
        let alertController = UIAlertController(title: "Hello!", message: "This is ActionSheet Sample", preferredStyle: .ActionSheet)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alertController.addAction(defaultAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }

    
    @IBAction func alertButton3(sender: UIButton) {
        
        let alertController = UIAlertController(title: "Hello!", message: "This is Alert Sample", preferredStyle: .Alert)
        
//        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
//        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default){
            action in print("Pushed OK!!")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel){
            action in print("Pushed Cancel!!")
        }
        
        
        alertController.addAction(defaultAction)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
}