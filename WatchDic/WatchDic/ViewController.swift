//
//  ViewController.swift
//  WatchDic
//
//  Created by 堀 正洋 on 2015/12/10.
//  Copyright © 2015年 masahiro_hori. All rights reserved.
//

import UIKit

// tableViewを使う準備その1
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var listTableView: UITableView!
    // データを用意（データは部品）
    var data: Array<String> = [
        "ロレックス",
        "オメガ",
        "フランクミュラー",
        "エルメス",
        "ルイ・ヴィトン",
        "シャネル",
        "グッチ",
        "タグ ホイヤー",
        "バーバリー",
        "ブルガリ",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // tableViewを使う準備その2(どのtableViewと相談するか)
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
    }
    
    
    // tableViewと相談する⬇︎
    // セクションの数どうする？
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // セルの数どうする？
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // セルの中身どうする？
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // watchCellを使うよ
        let cell = tableView.dequeueReusableCellWithIdentifier("watchCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = self.data[indexPath.row]
        return cell
    }
    
    // セルを選択した時どうする？
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 詳細画面にいってくれ
        // 詳細画面を呼ぶ
        // 何を保存するか保証してあげる必要がある(as!)
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("DetailView") as! DetailViewController
        
        // 詳細画面にデータを渡す
        next.word = self.data[indexPath.row]
        
        // 呼んできた詳細画面を出す
        self.navigationController?.pushViewController(next, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

