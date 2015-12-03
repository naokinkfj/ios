//
//  ViewController.swift
//  dispColor
//
//  Created by 堀 正洋 on 2015/12/03.
//  Copyright © 2015年 masahiro_hori. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    @IBOutlet weak var colorLavel: UILabel!
    
    // ランダムを使う準備
    let randomSource = GKARC4RandomSource()
    var colorR = 0
    var colorG = 0
    var colorB = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func returnTop(segue: UIStoryboardSegue){
    }

    // この画面が表示される時に呼び出される
    override func viewWillAppear(animated: Bool) {
        // 0〜255のランダムな値を3つ求めます。
        colorR = randomSource.nextIntWithUpperBound(256)
        colorG = randomSource.nextIntWithUpperBound(256)
        colorB = randomSource.nextIntWithUpperBound(256)
        
        // 3つの値を表示します。
        colorLavel.text = "R=\(colorR), G=\(colorG), B=\(colorB)"
    }
    
    // 画面が切り替わる時に呼び出される
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // 切り変わり先の画面を取り出します。
        let nextvc = segue.destinationViewController as! colorViewController
        
        // 切り変わり先の変数に、この画面の変数の値を入れて、受け渡します。
        nextvc.colorR = colorR
        nextvc.colorG = colorG
        nextvc.colorB = colorB
    }
}

