//
//  ViewController.swift
//  WhatIsTheWeather
//
//  Created by 堀 正洋 on 2016/01/31.
//  Copyright © 2016年 masahiro_hori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var resultLavel: UILabel!
    
    var isSuccess = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func findWeathier(sender: AnyObject) {
        
        self.isSuccess = false
        
        let tmpUrl = NSURL(string: "http://www.weather-forecast.com/locations/" + cityTextField.text!.stringByReplacingOccurrencesOfString(" ", withString: "-") + "/forecasts/latest")
        
        if let url = tmpUrl {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
                if let urlContent = data {
                    let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                    
                    let webSiteArray = webContent?.componentsSeparatedByString("3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
                    
                    if webSiteArray!.count > 1 {
                        
                        let weatherArray = webSiteArray![1].componentsSeparatedByString("</span>")
                        
                        if weatherArray.count > 1 {
                            
                            self.isSuccess = true
                            
                            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                let weatherSumarry = weatherArray[0].stringByReplacingOccurrencesOfString("&deg;", withString: "º")
                                
                                self.resultLavel.text = weatherSumarry
                            })
                        }else{
                            self.isSuccess = false
                        }
                    }else{
                        self.isSuccess = false
                        self.resultLavel.text = "Couldn't find weather. Please try again."
                    }
                }
                if self.isSuccess == false{
                    self.resultLavel.text = "Couldn't find weather. Please try again."
                }else{
                    self.isSuccess = false
                    self.resultLavel.text = "Couldn't find weather. Please try again."
                }
            }
            task.resume()
            
        }else{
            self.isSuccess = false
            self.resultLavel.text = "Couldn't find weather. Please try again."
        }
        
    }
}

