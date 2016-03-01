//
//  StatViewController.swift
//  To-Do List
//
//  Created by Sam Mahdad on 2/29/16.
//  Copyright © 2016 Sam Mahdad. All rights reserved.
//

import UIKit

class StatViewController: UIViewController {
    
    @IBOutlet weak var displayCompletedTaskLabel: UILabel!
    
    @IBOutlet weak var taskLabel: UILabel!
    
    @IBOutlet weak var firstMessageLabel: UILabel!
    
    var numberOfCompletedTasks: Int?
    var totalNumberOfTasks: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskLabel.text = "Tasks"
        if numberOfCompletedTasks == 1 {
            taskLabel.text = "Task"
        }
        
        if Double(numberOfCompletedTasks!) / Double(totalNumberOfTasks!) < 0.5 {
            firstMessageLabel.text = "You can do this! You have completed"
        } else if Double(numberOfCompletedTasks!) / Double(totalNumberOfTasks!) < 0.9 {
            firstMessageLabel.text = "You are over halfway there! You have completed"
        } else if numberOfCompletedTasks == totalNumberOfTasks {
            firstMessageLabel.text = "You are done! You have completed"
        }else {
            firstMessageLabel.text = "Less than 10% left! You have completed"
        }
        
        
        displayCompletedTaskLabel.text = String(numberOfCompletedTasks!)
        displayCompletedTaskLabel.center = view.center
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
}
