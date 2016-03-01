//
//  TableViewController.swift
//  To-Do List
//
//  Created by Sam Mahdad on 2/28/16.
//  Copyright © 2016 Sam Mahdad. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var toDoListItems = [ToDoListItem]()
    
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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoListItems.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem", forIndexPath: indexPath)
        
        let item = toDoListItems[indexPath.row]
        
        
        configureTextForCell(cell, toDoListItem: item)
        decideCheckmark(cell, index: indexPath.row)

        // Configure the cell...

        return cell
    }
    
    func decideCheckmark(cell: UITableViewCell, index: Int) {
        if (toDoListItems[index].checked) {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
    }
    
    func configureTextForCell(cell: UITableViewCell, toDoListItem: ToDoListItem) {
        let label = cell.viewWithTag(100) as! UILabel
        label.text = toDoListItem.text
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        let cell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        let item = toDoListItems[indexPath.row]
        
        item.checked = !item.checked
        decideCheckmark(cell, index: indexPath.row)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
//    @IBAction func addItem(sender: AnyObject?) {
//        let newRowIndex = toDoListItems.count
//        let item = ToDoListItem(text: "New item", checked: false)
//        toDoListItems.append(item)
//        let indexPathToAdd = NSIndexPath(forRow: newRowIndex, inSection: 0)
//        tableView.insertRowsAtIndexPaths([indexPathToAdd], withRowAnimation: UITableViewRowAnimation.Automatic)
//    }
    
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        toDoListItems.removeAtIndex(indexPath.row)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
    }
    
    @IBAction func prepareForUnwind(something: UIStoryboardSegue) {
        
        
        if let svc = something.sourceViewController as? AddItemViewController {
            let itemNameFromSegue = svc.itemName
            let itemDateFromSegue = svc.itemDate
            
            let tempItem = ToDoListItem(text: itemNameFromSegue, paramDate: itemDateFromSegue)
            toDoListItems.append(tempItem)
            self.tableView.reloadData()
        }
        
    }
    
    @IBAction func prepareForUnwindCancel(something: UIStoryboardSegue) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        var validItem = 0
        var tempList = [ToDoListItem]()
        var currRow = 0
        for item in toDoListItems {
            if item.hasValidDate() {
                tempList.append(item)
                if item.checked {
                    validItem += 1
                }
            }
            currRow += 1
        }
        self.toDoListItems = tempList
        tableView.reloadData()
        
        var svc = segue!.destinationViewController as? StatViewController
        svc?.numberOfCompletedTasks = validItem
        svc?.totalNumberOfTasks = self.toDoListItems.count
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
