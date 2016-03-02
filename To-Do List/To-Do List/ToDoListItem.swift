//
//  ToDoListItem.swift
//  To-Do List
//
//  Created by Sam Mahdad on 2/28/16.
//  Copyright © 2016 Sam Mahdad. All rights reserved.
//

import UIKit

class ToDoListItem {
    var text: String?
    var checked: Bool
    var date: NSDate?
    
    init(text: String?, paramDate: NSDate?) {
        let twentyFourHours = 60 * 60 * 24.0
        self.text = text
        self.checked = false
        self.date = NSDate()
    }
    
    func hasValidDate() -> Bool {
        let twentyFourHours = 60 * 60 * 24.0
        let currentDate = NSDate()
        let twentyFourHourFromDate = NSDate(timeInterval: twentyFourHours, sinceDate: self.date!)
        
        
        let idk = currentDate.compare(twentyFourHourFromDate)
        let check = idk.rawValue
        return check <= 0
    }
    
    func updateDate() {
        self.date = NSDate()
    }
}