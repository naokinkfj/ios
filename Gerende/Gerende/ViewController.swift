//
//  ViewController.swift
//  Gerende
//
//  Created by 堀 正洋 on 2016/01/16.
//  Copyright © 2016年 masahiro_hori. All rights reserved.
//

import UIKit

// tableViewを使う準備その１
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var listTableView: UITableView!
    // データを配列で用意
    var data: Array<String> = [
        "スノボウェアでカワイさ２割増し…？スノボあるあるランキング",
        "現場にスノボ、旅行かばん＝バスの下、署員ら黙とう―軽井沢",
        "スノボ高原宜希、プロ初戦で優勝　目標は2022年北京冬季五輪",
        "スキーやスノボで凍傷に!? 凍傷を予防する防寒対策とは？",
        "家根谷、川口組は8位＝スノーボードW杯",
        "竹内17位、家根谷は18位＝スノーボードW杯",
        "初心者でも上級者っぽく思われる！？使うとモテそうなスノボ用語",
        "男性に聞いても出てこない！スノボ初心者の女性に嬉しい持ち物リスト",
        "iPhoneと連携するスノボ用バインディングが展示中、Cerevo製 走行データをリアルタイムに記録、発光機能もあり",
        "ASCII.jp：滑りながら撮れる！スキー・スノボ向けのカメラ内蔵ゴーグル",
        "スノーボード佐藤が就職＝JOC支援制度",
        "神崎恵さん直伝！冬の必勝イベントメイク スノボデートは？",
        "スノーボードの楽しさを2分22秒に凝縮！ もう「PEACE PARK」見た？ | Akimama ─ アウトドアカルチャーのニュースサイト",
        "絵本のような幻想的な雪山をスノボで冒険できるゲーム「Alto’s Adventure」レビュー - GIGAZINE",
        "価格.com - 上海問屋、スキー・スノーボード向け動画撮影カメラ「ゴーグルカム」",
        "大丈夫ですきっと寂しくないですよ！魅力いっぱい「ぼっちスノボ」のススメ",
        "センサー付きスノボ用バインディング『SNOW-1』ついに発売。滑りの状態を可視化しログ取得、スマホアプリで確認 - Engadget Japa...",
        "センサー付きスノボ用バインディング『SNOW-1』ついに発売。滑りの状態を可視化しログ取得、スマホアプリで確認 - Engadget Japa...",
        "世界初・スマホ連携スノーボードバインディング「SNOW-1」　重心や曲がり具合をリアルタイムに計測",
        "「私たち結婚しました」オ・ミンソク、カン・イェウォンとスノーボードでスキンシップ“幸せそうな微笑み”",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // tableViewを使う準備その２
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        // 作ったxibファイルを呼んでくる
        let nib = UINib(nibName: "GerendeTableViewCell", bundle: nil)
        let nibSmall = UINib(nibName: "GerendeTableViewCellSmall", bundle: nil)
        
        // listTableViewにcellを登録します
        self.listTableView.registerNib(nib, forCellReuseIdentifier: "gerendeCellNib")
        self.listTableView.registerNib(nibSmall, forCellReuseIdentifier: "gerendeCellSmallNib")
    }
    
    // tableViewと相談していく↓
    // Sectionの数を相談
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // cellの数を相談
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    // cellの中身を相談
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // gerendeCellって名前つけたやつを使う
        //let cell = tableView.dequeueReusableCellWithIdentifier("gerendeCellNib", forIndexPath: indexPath) as! GerendeTableViewCell
        //let cellSmall = tableView.dequeueReusableCellWithIdentifier("gerendeCellSmallNib", forIndexPath: indexPath) as! GerendeTableViewCellSmall
        
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("gerendeCellNib", forIndexPath: indexPath) as! GerendeTableViewCell
            cell.gerendeTextLavel.text = self.data[indexPath.row]
            cell.gerendeImageView.image = UIImage(named: "\(indexPath.row).png")
            return cell
        }else{
            let cellSmall = tableView.dequeueReusableCellWithIdentifier("gerendeCellSmallNib", forIndexPath: indexPath) as! GerendeTableViewCellSmall
            cellSmall.gerendeTextLavelSmall.text = self.data[indexPath.row]
            cellSmall.gerendeImageViewSmall.image = UIImage(named: "\(indexPath.row).png")
            return cellSmall
        }
    }
    
    // cellの高さの相談
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row % 2 == 0 {
            return 195
        }else {
            return 125
        }
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

