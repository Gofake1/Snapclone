//
//  FriendTableViewController.swift
//  Snapclone
//
//  Created by David Wu on 4/24/16.
//  Copyright © 2016 Gofake1. All rights reserved.
//

import UIKit

class FriendTableViewController: UITableViewController {
    var groups = ["Notre Dame": ["Prof Metoyer", "Prof Bui"]]
    var friends = ["Spencer King", "Barack Obama", "Prof Metoyer", "Kanye West", "Prof Bui", "Bob"]
    @IBOutlet weak var toolbar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        //let groupButton = UIBarButtonItem(title: "Group", style: .Plain, target: self, action: #selector(FriendTableViewController.makeGroupFromFriends))
        //let spaceItem = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: self, action: nil)
        //let buttons = [groupButton, spaceItem]
        //self.navigationController?.setToolbarItems(buttons, animated: true)
        self.toolbar.isHidden = true
    }

    func makeGroupFromFriends() {
        let rows = self.tableView.indexPathsForSelectedRows
        //groups["New Group"] = rows.joinWithSeperator(", ")
        print(rows)
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
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath)
            cell.textLabel!.text = self.friends[(indexPath as NSIndexPath).row]
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
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if (editing) {
            //self.navigationController?.setToolbarHidden(false, animated: true)
            self.toolbar.isHidden = false
        } else {
            //self.navigationController?.setToolbarHidden(true, animated: true)
            self.toolbar.isHidden = true
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            if ((indexPath as NSIndexPath).section == 0) {
                let keys = Array(self.groups.keys)
                self.groups.removeValue(forKey: keys[(indexPath as NSIndexPath).row])
            } else {
                self.friends.remove(at: (indexPath as NSIndexPath).row)
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // MARK: - Navigation

    @IBAction func unwindToSettings(_ sender: UIBarButtonItem) {
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
