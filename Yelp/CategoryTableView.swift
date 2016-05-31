//
//  CategoryTableView.swift
//  Yelp
//
//  Created by Philihp Busby on 2016-05-30.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class CategoryTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    var isExpanded: Bool = false
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Categories.data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCellWithIdentifier("CategoryCell") as! CategoryCell
        let category = Categories.data[indexPath.row]
        cell.categoryLabel.text = category["name"]
        cell.code = category["code"]
        cell.valueSwitch.on = defaults.boolForKey("snoop.yelp.categories.\(category["code"])")
        return cell
    }
    

}
