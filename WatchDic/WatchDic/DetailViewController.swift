//
//  DetailViewController.swift
//  WatchDic
//
//  Created by 堀 正洋 on 2015/12/10.
//  Copyright © 2015年 masahiro_hori. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailWebView: UIWebView!
    
    // データの受け取る部品を用意する
    var word: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // URLを指定する(URLエンコードします。)
        //let address = "https://ja.wikipedia.org/wiki/\(self.word)".stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
        let address = "https://www.google.co.jp/search?q=\(self.word)&source=lnms&tbm=isch&sa=X&ved=0ahUKEwiv46bDq9HJAhWkraYKHUMDBt8Q_AUICCgC&biw=1203&bih=669#tbm=isch".stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
        
        // URLを変換する
        let url = NSURL(string: address!)
        // 上のURLでアクセスしてね
        let request = NSURLRequest(URL: url!)
        
        // URLをdetailViewに標示する
        self.detailWebView.loadRequest(request)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
