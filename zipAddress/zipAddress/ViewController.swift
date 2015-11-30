//
//  ViewController.swift
//  zipAddress
//
//  Created by 堀 正洋 on 2015/11/30.
//  Copyright © 2015年 masahiro_hori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var zipTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func tapReturn() {
    }
    
    
    @IBAction func tapSearch() {
        guard let ziptext = zipTextField.text else{
            // 値がnilだったら、終了します。
            return
        }
        
        // クリエスとするURLを作ります。
        let urlStr = "http://api.zipaddress.net/?zipcode=\(ziptext)"
        
        if let url = NSURL(string: urlStr){
            // urlオブジェクトがnilでなければ、検索処理オブジェクトを作ります。
            print(url)
            
            let urlSession = NSURLSession.sharedSession()
            // 「検索処理が完了したらonGetAddressを呼び出す」というタスクを作る。
            let task = urlSession.dataTaskWithURL(url, completionHandler: self.onGetAddress)
            // タスクを実行。
            task.resume()
        }
    }
    
    func onGetAddress(data: NSData?, res:NSURLResponse?, error: NSError?){
        // 確認のためデータを表示します。
        print(data)
    }
}

