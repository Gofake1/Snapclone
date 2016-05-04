//
//  BubbleCollectionViewController.swift
//  Snapclone
//
//  Created by David Wu on 3/23/16.
//  Copyright © 2016 Gofake1. All rights reserved.
//

import UIKit

class BubbleCollectionViewController: UICollectionViewController, UIGestureRecognizerDelegate, Dimmable {
    var data = [ [["name": "Spencer", "photo": "", "icon": "box_colored_notify_more", "story": "no"]],
                 [["name": "", "photo": "cnn.jpg"]],
                 [["name": "10 mins ago", "photo": "1.jpg"]]
               ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Init rest of data
        data[0].append(["name": "Obama", "photo": "", "icon": "box_colored_notify_1", "story": "no"])
        data[0].append(["name": "Metoyer", "photo": "metoyer.jpg", "icon": "", "story": "yes"])
        data[0].append(["name": "Kanye", "photo": "", "icon": "", "story": "no"])
        data[0].append(["name": "Peter", "photo": "", "icon": "", "story": "no"])
        data[0].append(["name": "Bob", "photo": "", "icon": "", "story": "no"])
        data[1].append(["name": "", "photo": "espn.jpg"])
        data[1].append(["name": "", "photo": "mtv.jpg"])
        data[1].append(["name": "", "photo": "natgeo.jpg"])
        data[1].append(["name": "Study Abroad", "photo": ""])
        data[1].append(["name": "World Cup", "photo": ""])
        data[1].append(["name": "Olympics", "photo": ""])
        data[1].append(["name": "Graduation", "photo": ""])
        data[2].append(["name": "1 hr ago", "photo": "2.jpg"])
        data[2].append(["name": "8 hrs ago", "photo": "3.jpg"])
        data[2].append(["name": "10 hrs ago", "photo": "4.jpg"])

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Do any additional setup after loading the view.
        // Push content below status bar
        self.collectionView!.contentInset = UIEdgeInsetsMake(15, 0, 0, 0)
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        dim(.In, alpha: 0.5, speed: 0.5)
    }
    
    @IBAction func unwindFromSegue(segue: UIStoryboardSegue) {
        dim(.Out, speed: 0.5)
    }
    
    @IBAction func tapDetected(sender: UITapGestureRecognizer) {
        if (sender.state == .Ended) {
            let location = sender.locationInView(self.collectionView)
            if let indexPath = self.collectionView?.indexPathForItemAtPoint(location) {
                if (indexPath.section == 0 && (indexPath.row == 0 || indexPath.row == 1)) {
                    self.performSegueWithIdentifier("bubbleTapped", sender: self)
                }
            }
        }
    }

    @IBAction func longPressDetected(sender: UILongPressGestureRecognizer) {
        if (sender.state == .Ended) {
            let location = sender.locationInView(self.collectionView)
            if let indexPath = self.collectionView?.indexPathForItemAtPoint(location) {
                if (indexPath.section == 0) {
                    self.performSegueWithIdentifier("bubbleLongPressed", sender: self)
                }
            }
        }
    }
    
    @IBAction func doubleTapDetected(sender: UITapGestureRecognizer) {
        if (sender.state == .Ended) {
            let location = sender.locationInView(self.collectionView)
            if let indexPath = self.collectionView?.indexPathForItemAtPoint(location) {
                if (indexPath.section == 0) {
                    self.performSegueWithIdentifier("bubbleDoubleTapped", sender: self)
                }
            }
        }
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 3
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let header = self.collectionView?.dequeueReusableSupplementaryViewOfKind("UICollectionElementKindSectionHeader", withReuseIdentifier: "sectionHeader", forIndexPath: indexPath) as! BubbleCollectionHeaderView
        if (indexPath.section == 0) {
            header.sectionHeaderLabel.text = "Friends"
        } else if (indexPath.section == 1) {
            header.sectionHeaderLabel.text = "Discover"
        } else {
            header.sectionHeaderLabel.text = "My Story"
        }
        return header
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[section].count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Bubble", forIndexPath: indexPath) as! BubbleCollectionViewCell
        
        // Configure the cell
        let h = CGFloat(arc4random() % 256)/256
        let s = CGFloat(arc4random() % 30)/100 + 0.4
        if (self.data[indexPath.section][indexPath.row]["photo"]! != "") {
            cell.imageView.image = UIImage(named: self.data[indexPath.section][indexPath.row]["photo"]!)
        } else {
            cell.imageView.backgroundColor = UIColor(hue: h, saturation: s, brightness: 0.95, alpha: 1.0)
        }
        cell.nameLabel.text = self.data[indexPath.section][indexPath.row]["name"]!
        if (indexPath.section == 0) {
            if (self.data[indexPath.section][indexPath.row]["story"]! == "yes") {
                cell.nameLabel.textColor = UIColor.yellowColor()
            }
        }
        if (indexPath.section == 0 && self.data[indexPath.section][indexPath.row]["icon"]! != "") {
            cell.iconView.image = UIImage(named: self.data[indexPath.section][indexPath.row]["icon"]!)
        } else {
            cell.iconView.image = nil
        }
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    /*
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("bubbleTapped", sender: self)
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
