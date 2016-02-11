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
    var data: Array<Dictionary<String, String>> = [
        [
        
            "title":"スノボウェアでカワイさ２割増し…？スノボあるあるランキング",
            "url":"http://netallica.yahoo.co.jp/news/20160115-21506059-granking",
        ],
        [
            "title":"現場にスノボ、旅行かばん＝バスの下、署員ら黙とう―軽井沢",
            "url":"http://headlines.yahoo.co.jp/hl?a=20160115-00000162-jij-soci",
            ],
        
        [
            "title":"スノボ高原宜希、プロ初戦で優勝　目標は2022年北京冬季五輪",
            "url":"http://headlines.yahoo.co.jp/hl?a=20160112-00010002-fukui-l18",
        ],
        
        [
            "title":"スキーやスノボで凍傷に!? 凍傷を予防する防寒対策とは？",
            "url":"http://netallica.yahoo.co.jp/news/20160110-86621603-doctorsme",
            ],
        
        [
        "title":"家根谷、川口組は8位＝スノーボードW杯",
        "url":"http://headlines.yahoo.co.jp/hl?a=20160109-00000115-jij-spo",
            ],
        
        [
        "title":"竹内17位、家根谷は18位＝スノーボードW杯",
        "url":"http://headlines.yahoo.co.jp/hl?a=20160109-00000054-jij-spo",
            ],
        
        [
        "title":"初心者でも上級者っぽく思われる！？使うとモテそうなスノボ用語",
        "url":"http://netallica.yahoo.co.jp/news/20160109-80159109-nanapi",
            ],
        
        [
        "title":"男性に聞いても出てこない！スノボ初心者の女性に嬉しい持ち物リスト",
        "url":"http://netallica.yahoo.co.jp/news/20160108-38568265-nanapi",
            ],
        
        [
        "title":"iPhoneと連携するスノボ用バインディングが展示中、Cerevo製 走行データをリアルタイムに記録、発光機能もあり",
        "url":"http://headlines.yahoo.co.jp/hl?a=20160107-00000029-impress-sci",
            ],
        
        [
        "title":"ASCII.jp：滑りながら撮れる！スキー・スノボ向けのカメラ内蔵ゴーグル",
        "url":"http://ascii.jp/elem/000/001/101/1101657/",
            ],
        
        [
        "title":"スノーボード佐藤が就職＝JOC支援制度",
        "url":"http://headlines.yahoo.co.jp/hl?a=20160105-00000091-jij-spo",
            ],
        
        [
        "title":"神崎恵さん直伝！冬の必勝イベントメイク スノボデートは？",
        "url":"http://netallica.yahoo.co.jp/news/20160105-45818092-bibeaute",
            ],
        
        [
        "title":"スノーボードの楽しさを2分22秒に凝縮！ もう「PEACE PARK」見た？ | Akimama ─ アウトドアカルチャーのニュースサイト",
        "url":"http://www.a-kimama.com/culture/2016/01/36328/",
            ],
        
        [
        "title":"絵本のような幻想的な雪山をスノボで冒険できるゲーム「Alto’s Adventure」レビュー - GIGAZINE",
        "url":"http://gigazine.net/news/20151230-altos-adventure/",
            ],
        
        [
        "title":"価格.com - 上海問屋、スキー・スノーボード向け動画撮影カメラ「ゴーグルカム」",
        "url":"http://news.kakaku.com/prdnews/cd=camera/ctcd=2020/id=53556/",
            ],
        
        [
        "title":"大丈夫ですきっと寂しくないですよ！魅力いっぱい「ぼっちスノボ」のススメ",
        "url":"http://netallica.yahoo.co.jp/news/20151224-26453149-nanapi",
            ],
        
        [
        "title":"センサー付きスノボ用バインディング『SNOW-1』ついに発売。滑りの状態を可視化しログ取得、スマホアプリで確認 - Engadget Japa...",
        "url":"http://japanese.engadget.com/2015/12/18/snow-1/?utm_content=buffer91b64&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer",
            ],
        
        [
        "title":"センサー付きスノボ用バインディング『SNOW-1』ついに発売。滑りの状態を可視化しログ取得、スマホアプリで確認 - Engadget Japa...",
        "url":"http://japanese.engadget.com/2015/12/18/snow-1/",
            ],
        
        [
        "title":"世界初・スマホ連携スノーボードバインディング「SNOW-1」　重心や曲がり具合をリアルタイムに計測",
        "url":"http://headlines.yahoo.co.jp/hl?a=20151217-00000091-zdn_n-prod",
            ],
        
        [
        "title":"「私たち結婚しました」オ・ミンソク、カン・イェウォンとスノーボードでスキンシップ“幸せそうな微笑み”",
        "url":"http://netallica.yahoo.co.jp/news/20151213-56847831-kstyle",
            ]

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
            cell.gerendeTextLavel.text = self.data[indexPath.row]["title"]
            cell.gerendeImageView.image = UIImage(named: "\(indexPath.row).png")
            return cell
        } else {
            let cellSmall = tableView.dequeueReusableCellWithIdentifier("gerendeCellSmallNib", forIndexPath: indexPath) as! GerendeTableViewCellSmall
            cellSmall.gerendeTextLavelSmall.text = self.data[indexPath.row]["title"]
            cellSmall.gerendeImageViewSmall.image = UIImage(named: "\(indexPath.row).png")
            return cellSmall
        }
    }
    
    // cellの高さの相談
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row % 2 == 0 {
            return 195
        } else {
            return 125
        }
    }
    
    // cellを選択した時どうする？
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 次の画面へ行く
        // as! でキャストする
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
        
        vc.url = self.data[indexPath.row]["url"]
        // 画面を表示する
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

