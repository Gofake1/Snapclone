//
//  BubbleCollectionViewController.swift
//  Snapclone
//
//  Created by David Wu on 3/23/16.
//  Copyright © 2016 Gofake1. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Bubble"

class BubbleCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(BubbleCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        // Status bar
        self.collectionView!.contentInset = UIEdgeInsetsMake(15, 0, 0, 0)
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
        blurView.frame = CGRectMake(0, 0, self.view.frame.width, 20)
        self.view.addSubview(blurView)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 80
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! BubbleCollectionViewCell
    
        // Configure the cell
        let h = CGFloat(arc4random() % 256)/256
        let s = CGFloat(arc4random() % 30)/100 + 0.4
        cell.backgroundColor = UIColor(hue: h, saturation: s, brightness: 0.95, alpha: 1.0)
        //cell.image =
        cell.layer.cornerRadius = 32.5
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
