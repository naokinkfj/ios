//
//  DetailViewController.swift
//  Gerende
//
//  Created by 堀 正洋 on 2016/02/06.
//  Copyright © 2016年 masahiro_hori. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailWebView: UIWebView!
    // urlを渡す場所
    var url: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // URLを指定して
        let url = "http://netallica.yahoo.co.jp/news/20160115-21506059-granking"
        
        let nsUrl = NSURL(string: url)
        let request = NSURLRequest(URL: nsUrl!)
        // webviewに表示する
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
