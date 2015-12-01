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
    @IBOutlet weak var prefLabel: UILabel!
    @IBOutlet weak var addressLavel: UILabel!
    
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
        // 受け取ったdataをJSON解析します。もしエラーになったらcatchへジャンプします。
        do{
            // dataのJSON解析を実行します。
            let jsonDic = try NSJSONSerialization.JSONObjectWithData(
                data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            
            // 解析できた値を調べます
            if let code = jsonDic["code"] as? Int {
                // codeという項目が整数なら、住所検索APIからのコード情報です。
                if code != 200 {
                    // コードが200でない時は、検索エラーです。
                    if let errmsg = jsonDic["message"] as? String{
                        print(errmsg)
                    }
                }
            }
        
            if let data = jsonDic["data"] as? NSDictionary{
                // dataという項目が辞書データなら、その中身を調べます。
                if let pref = data["pref"] as? String {
                    dispatch_sync(dispatch_get_main_queue()){
                        self.prefLabel.text = pref
                    }
                }
                if let address = data["address"] as? String {
                    dispatch_async(dispatch_get_main_queue()){
                        self.addressLavel.text = address
                    }
                }
            }
        
        }catch{
            // JSON解析に失敗した時に実行
            print("エラーです。")
        }
    }
}

