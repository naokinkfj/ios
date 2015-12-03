//
//  colorViewController.swift
//  dispColor
//
//  Created by 堀 正洋 on 2015/12/03.
//  Copyright © 2015年 masahiro_hori. All rights reserved.
//

import UIKit

class colorViewController: UIViewController {
    
    // 3原色を入れる変数
    var colorR = 0
    var colorG = 0
    var colorB = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        // RGBの値から色を作ります。
        let backColor = UIColor(
              red: CGFloat(colorR) / 256.0
            , green: CGFloat(colorG) / 256.0
            , blue: CGFloat(colorB) / 256.0
            , alpha: 1.0
        )
        
        // 作った色を背景色に設定します。
        view.backgroundColor = backColor
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
