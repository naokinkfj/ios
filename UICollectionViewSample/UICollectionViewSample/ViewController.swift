//
//  ViewController.swift
//  UICollectionViewSample
//
//  Created by 堀 正洋 on 2016/01/17.
//  Copyright © 2016年 masahiro_hori. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionViewList: UICollectionView!
    var day :Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.collectionViewList.dataSource = self
        self.collectionViewList.delegate = self
        
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        self.collectionViewList.registerNib(nib, forCellWithReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 365
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell
        
        day = indexPath.row + 1
        cell.collectionCell.text = String(day)
        
        cell.backgroundColor = UIColor.whiteColor()
        
        return cell
    }
    
}

