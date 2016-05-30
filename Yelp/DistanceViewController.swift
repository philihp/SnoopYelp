//
//  DistanceViewController.swift
//  Yelp
//
//  Created by Philihp Busby on 2016-05-30.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

protocol DistanceDelegate {
    func delegateHandlingOfDistanceFromDistanceController(distance: YelpDistanceMode)
}

class DistanceViewController: UITableViewController {
    
    var delegate: DistanceDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DistanceCell", forIndexPath: indexPath) as! DistanceCell
        let enumeratedValue = YelpDistanceMode(rawValue: indexPath.row)!
        cell.titleLabel.text = enumeratedValue.description
        cell.detailLabel.text = enumeratedValue.details
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
        
        if let distance = YelpDistanceMode(rawValue: indexPath.row) {
            delegate?.delegateHandlingOfDistanceFromDistanceController(distance)
        }
        
        self.performSegueWithIdentifier("unwindToFilters", sender: self)
    }

}
