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

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return self.groups.count
        } else {
            return self.friends.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if ((indexPath as NSIndexPath).section == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath)
            let keys = Array(self.groups.keys)
            let title = keys[(indexPath as NSIndexPath).row]
            let subtitle = self.groups[title]?.joined(separator: ", ")
            cell.textLabel!.text = title
            cell.detailTextLabel!.text = subtitle
            if (self.selectedGroups.contains(keys[(indexPath as NSIndexPath).row])) {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath)
            cell.textLabel!.text = self.friends[(indexPath as NSIndexPath).row]
            if (self.selected.contains(self.friends[(indexPath as NSIndexPath).row])) {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0) {
            return "Groups"
        } else {
            return "Friends"
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if ((indexPath as NSIndexPath).section == 0) {
            let keys = Array(self.groups.keys)
            if (self.selectedGroups.contains(keys[(indexPath as NSIndexPath).row])) {
                self.selectedGroups.remove(at: self.selectedGroups.index(of: keys[(indexPath as NSIndexPath).row])!)
            } else {
                self.selectedGroups.append(keys[(indexPath as NSIndexPath).row])
            }
        } else {
            if (self.selected.contains(self.friends[(indexPath as NSIndexPath).row])) {
                self.selected.remove(at: self.selected.index(of: self.friends[(indexPath as NSIndexPath).row])!)
            } else {
                self.selected.append(self.friends[(indexPath as NSIndexPath).row])
            }
        }
        tableView.reloadData()
    }

    // MARK: - Navigation
    
    @IBAction func unwindToCamera(_ sender: UIBarButtonItem) {
        self.parent?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendPhoto(_ sender: UIBarButtonItem) {
        self.parent?.dismiss(animated: true, completion: nil)
    }
    
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
