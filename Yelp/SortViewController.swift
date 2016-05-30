//
//  SortViewController.swift
//  Yelp
//
//  Created by Philihp Busby on 2016-05-30.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

protocol SortDelegate {
    func delegateHandlingOfSortingFromSortController(sortBy: YelpSortMode)
}

class SortViewController: UITableViewController {
    
    var delegate: SortDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // number of different possible values for YelpSortMode
        return 3
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SortCell", forIndexPath: indexPath) as! SortCell
        let enumeratedValue = YelpSortMode(rawValue: indexPath.row)!
        cell.titleLabel.text = enumeratedValue.description
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
        
        if let sorting = YelpSortMode(rawValue: indexPath.row) {
            delegate?.delegateHandlingOfSortingFromSortController(sorting)
        }
        
        self.performSegueWithIdentifier("unwindToFilters", sender: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
