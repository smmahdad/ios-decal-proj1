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
    
    var numberOfCompletedTasks: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayCompletedTaskLabel.text = String(numberOfCompletedTasks!)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
}
