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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        dim(.in, alpha: 0.5, speed: 0.5)
    }
    
    @IBAction func unwindFromSegue(_ segue: UIStoryboardSegue) {
        dim(.out, speed: 0.5)
    }
    
    @IBAction func tapDetected(_ sender: UITapGestureRecognizer) {
        if (sender.state == .ended) {
            let location = sender.location(in: self.collectionView)
            if let indexPath = self.collectionView?.indexPathForItem(at: location) {
                if ((indexPath as NSIndexPath).section == 0 && ((indexPath as NSIndexPath).row == 0 || (indexPath as NSIndexPath).row == 1)) {
                    self.performSegue(withIdentifier: "bubbleTapped", sender: self)
                }
            }
        }
    }

    @IBAction func longPressDetected(_ sender: UILongPressGestureRecognizer) {
        if (sender.state == .ended) {
            let location = sender.location(in: self.collectionView)
            if let indexPath = self.collectionView?.indexPathForItem(at: location) {
                if ((indexPath as NSIndexPath).section == 0) {
                    self.performSegue(withIdentifier: "bubbleLongPressed", sender: self)
                }
            }
        }
    }
    
    @IBAction func doubleTapDetected(_ sender: UITapGestureRecognizer) {
        if (sender.state == .ended) {
            let location = sender.location(in: self.collectionView)
            if let indexPath = self.collectionView?.indexPathForItem(at: location) {
                if ((indexPath as NSIndexPath).section == 0) {
                    self.performSegue(withIdentifier: "bubbleDoubleTapped", sender: self)
                }
            }
        }
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = self.collectionView?.dequeueReusableSupplementaryView(ofKind: "UICollectionElementKindSectionHeader", withReuseIdentifier: "sectionHeader", for: indexPath) as! BubbleCollectionHeaderView
        if ((indexPath as NSIndexPath).section == 0) {
            header.sectionHeaderLabel.text = "Friends"
        } else if ((indexPath as NSIndexPath).section == 1) {
            header.sectionHeaderLabel.text = "Discover"
        } else {
            header.sectionHeaderLabel.text = "My Story"
        }
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[section].count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Bubble", for: indexPath) as! BubbleCollectionViewCell
        
        // Configure the cell
        let h = CGFloat(arc4random() % 256)/256
        let s = CGFloat(arc4random() % 30)/100 + 0.4
        if (self.data[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]["photo"]! != "") {
            cell.imageView.image = UIImage(named: self.data[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]["photo"]!)
        } else {
            cell.imageView.backgroundColor = UIColor(hue: h, saturation: s, brightness: 0.95, alpha: 1.0)
        }
        cell.nameLabel.text = self.data[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]["name"]!
        if ((indexPath as NSIndexPath).section == 0) {
            if (self.data[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]["story"]! == "yes") {
                cell.nameLabel.textColor = UIColor.yellow
            }
        }
        if ((indexPath as NSIndexPath).section == 0 && self.data[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]["icon"]! != "") {
            cell.iconView.image = UIImage(named: self.data[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]["icon"]!)
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
