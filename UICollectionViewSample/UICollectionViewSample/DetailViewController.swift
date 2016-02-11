//
//  DetailViewController.swift
//  UICollectionViewSample
//
//  Created by 堀 正洋 on 2016/02/11.
//  Copyright © 2016年 masahiro_hori. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var totalMoney: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let userDefault = NSUserDefaults.standardUserDefaults()
        var totalCount = 0
        
        for day in 0..<365 {
            let tmpSaving = userDefault.objectForKey(String(day))
            if tmpSaving != nil {
                let intSaving = tmpSaving as! Int
                totalCount += intSaving
            }
        }
        
        totalMoney.text = String(totalCount)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
