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
        
        let okAction = UIAlertAction(title: "OK", style: .Default){
            action in print("Pushed OK!!")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel){
            action in print("Pushed Cancel!!")
        }
        
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func alertButton4(sender: UIButton) {
        let alertController = UIAlertController(title: "Hello!", message: "This is Alert Sample", preferredStyle: .ActionSheet)
        
        let firstAction = UIAlertAction(title: "First", style: .Default){
            action in print("Pushed First!!")
        }
        
        let secondAction = UIAlertAction(title: "Second", style: .Default){
            action in print("Pushed Second!!")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel){
            action in print("Pushed Cancel!!")
        }
        
        alertController.addAction(firstAction)
        alertController.addAction(secondAction)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func alertButton5(sender: UIButton) {
        
//        var inputTextField: UITextField?
//        var passwordField: UITextField?
        
        let alertController = UIAlertController(title: "Login", message: "Input your ID and Password", preferredStyle: .Alert)
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel){
            action -> Void in print("Pushed CANCEL")
        }
        alertController.addAction(cancelAction)
        
        let loginAction: UIAlertAction = UIAlertAction(title: "Loing", style: .Default){
            action -> Void in print("Pushed Login")
        }
        alertController.addAction(loginAction)
        
        alertController.addTextFieldWithConfigurationHandler { textField -> Void in
//            inputTextField = textField
            textField.placeholder = "ID"
        }
        
        alertController.addTextFieldWithConfigurationHandler { textField -> Void in
//            passwordField = textField
            textField.secureTextEntry = true
            textField.placeholder = "password"
        }
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}