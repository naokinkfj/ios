//
//  ViewController.swift
//  janken
//
//  Created by 堀 正洋 on 2015/11/29.
//  Copyright © 2015年 masahiro_hori. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    
    let randomSource = GKARC4RandomSource()

    @IBOutlet weak var computerImageView: UIImageView!
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 180度のラジアンを求めます。
        let angle:CGFloat = CGFloat((180.0 * M_PI) / 180.0)
        // イメージビューを回転させる
        computerImageView.transform = CGAffineTransformMakeRotation(angle)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func tapStart() {
        // イメージビューにグーを表示します。
        computerImageView.image = UIImage(named: "guu.jpeg")
        playerImageView.image = UIImage(named: "guu.jpeg")
        
        // ラベルにじゃんけんと表示します。
        messageLabel.text = "じゃんけん！"
    }
    
    @IBAction func tagGuu() {
        playerImageView.image = UIImage(named: "guu.jpeg")
        doComputer(0)
    }
    
    @IBAction func tapChoki() {
        playerImageView.image = UIImage(named: "choki.jpeg")
        doComputer(1)
    }
    
    @IBAction func tapPar() {
        playerImageView.image = UIImage(named: "par.jpeg")
        doComputer(2)
    }
    
    func doComputer(playter:Int){
        // コンピュータの手を0~2のランダムな値を求めます。
        let computer = randomSource.nextIntWithUpperBound(3)
        // 勝敗用の文字列を用意します。
        var msg = ""
        
        switch computer{
        case 0:
            // グー
            computerImageView.image = UIImage(named: "guu.jpeg")
            switch playter{
            case 0:
                msg = "あいこ"
            case 1:
                msg = "あなたの負け"
            case 2:
                msg = "あなたの勝ち"
            default:
                break
            }
            
        case 1:
            // チョキ
            computerImageView.image = UIImage(named: "choki.jpeg")
            switch playter{
            case 0:
                msg = "あなたの勝ち"
            case 1:
                msg = "あいこ"
            case 2:
                msg = "あなたの負け"
            default:
                break
            }
            
        case 2:
            // パー
            computerImageView.image = UIImage(named: "par.jpeg")
            switch playter{
            case 0:
                msg = "あなたの負け"
            case 1:
                msg = "あなたの勝ち"
            case 2:
                msg = "あいこ"
            default:
                break
            }
        default:
            break
        }
        
        messageLabel.text = msg
    }
    
}

