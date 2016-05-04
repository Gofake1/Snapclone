//
//  SendTableViewController.swift
//  Snapclone
//
//  Created by David Wu on 4/24/16.
//  Copyright © 2016 Gofake1. All rights reserved.
//

import UIKit

class SendTableViewController: UITableViewController {
    var groups = ["Notre Dame": ["Prof Metoyer", "Prof Bui"]]
    var friends = ["Spencer King", "Prof Metoyer", "Kanye West", "Prof Bui", "Barack Obama", "Bob"]
    var selected: Array<String> = []
    var selectedGroups: Array<String> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return self.groups.count
        } else {
            return self.friends.count
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            let cell = tableView.dequeueReusableCellWithIdentifier("groupCell", forIndexPath: indexPath)
            let keys = Array(self.groups.keys)
            let title = keys[indexPath.row]
            let subtitle = self.groups[title]?.joinWithSeparator(", ")
            cell.textLabel!.text = title
            cell.detailTextLabel!.text = subtitle
            if (self.selectedGroups.contains(keys[indexPath.row])) {
                cell.accessoryType = .Checkmark
            } else {
                cell.accessoryType = .None
            }
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier("friendCell", forIndexPath: indexPath)
            cell.textLabel!.text = self.friends[indexPath.row]
            if (self.selected.contains(self.friends[indexPath.row])) {
                cell.accessoryType = .Checkmark
            } else {
                cell.accessoryType = .None
            }
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0) {
            return "Groups"
        } else {
            return "Friends"
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.section == 0) {
            let keys = Array(self.groups.keys)
            if (self.selectedGroups.contains(keys[indexPath.row])) {
                self.selectedGroups.removeAtIndex(self.selectedGroups.indexOf(keys[indexPath.row])!)
            } else {
                self.selectedGroups.append(keys[indexPath.row])
            }
        } else {
            if (self.selected.contains(self.friends[indexPath.row])) {
                self.selected.removeAtIndex(self.selected.indexOf(self.friends[indexPath.row])!)
            } else {
                self.selected.append(self.friends[indexPath.row])
            }
        }
        tableView.reloadData()
    }

    // MARK: - Navigation
    
    @IBAction func unwindToCamera(sender: UIBarButtonItem) {
        self.parentViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func sendPhoto(sender: UIBarButtonItem) {
        self.parentViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
