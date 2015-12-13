//
//  GameViewController.swift
//  sampleGame
//
//  Created by 堀 正洋 on 2015/12/13.
//  Copyright (c) 2015年 masahiro_hori. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 640 × 1136 サイズのゲームシーンを作ります。
        let scene = GameScene(size:CGSize(width: 640, height: 1136))
        // Main.storyboardのviewをSKViewとしてアクセスします。
        let skView = self.view as! SKView
        // 画面のモードを、画面サイズにフィットするように拡大縮小するモードにします。
        scene.scaleMode = .AspectFill
        // SKViewにそのシーンを標示します。
        skView.presentScene(scene)
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
