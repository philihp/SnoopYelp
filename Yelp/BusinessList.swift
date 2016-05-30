//
//  BusinessList.swift
//  Yelp
//
//  Created by Philihp Busby on 2016-05-26.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//
import UIKit

class BusinessList: NSObject, UITableViewDelegate, UITableViewDataSource {

    var businesses: [Business] = []
    
    init(_ businessArray: [Business]) {
        self.businesses = businessArray
    }
    
    @objc func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businesses.count ?? 0
    } 
    
    @objc func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell", forIndexPath: indexPath) as! BusinessTableViewCell
        cell.data = businesses[indexPath.row]
        return cell
    }
    
}
