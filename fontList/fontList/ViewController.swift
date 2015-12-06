//
//  ViewController.swift
//  fontList
//
//  Created by 堀 正洋 on 2015/12/06.
//  Copyright © 2015年 masahiro_hori. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // フォント名を入れる配列
    var fontName_array:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        // フォントファミリー名を全て調べます。
        for fontFamilyName in UIFont.familyNames() {
            // そのフォントファミリー名が持っているフォント名を全て調べます。
            for fontName in UIFont.fontNamesForFamilyName(fontFamilyName as String){
                // フォント名を配列に追加します。
                fontName_array.append(fontName as String)
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fontName_array.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // セルを作ります。
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "myCell")
        
        // このセルに標示するフォント名を取得します。
        let fontname = fontName_array[indexPath.row]
        
        // テキストに指定したフォントでサンプルを標示します。
        cell.textLabel?.font  = UIFont(name: fontname, size: 18)
        cell.textLabel?.text = "ABCDE abcde 012345 あいうえお"
        
        // サブテキストにフォント名を標示します。
        cell.detailTextLabel?.textColor = UIColor.brownColor()
        cell.detailTextLabel?.text = fontname
        
        return cell
    }
}

