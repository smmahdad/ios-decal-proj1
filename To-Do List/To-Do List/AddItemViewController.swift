//
//  AddItemViewController.swift
//  To-Do List
//
//  Created by Sam Mahdad on 2/28/16.
//  Copyright © 2016 Sam Mahdad. All rights reserved.
//

import Foundation
import UIKit

class AddItemViewController:  UIViewController, UITextFieldDelegate {
    var itemName: String?
    var itemDate: NSDate?
    
    @IBOutlet weak var itemNameTextBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        itemNameTextBox.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        self.itemName = itemNameTextBox.text
        self.itemDate = NSDate()
    }

//    @IBAction func cancel(sender: AnyObject) {
//        navigationController!.dismissViewControllerAnimated(true, completion: {})
//    }
//    
//    @IBAction func done(sender: AnyObject) {
//        navigationController!.dismissViewControllerAnimated(true, completion: {})
//    }
}
