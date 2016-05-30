//
//  FiltersViewController.swift
//  Yelp
//
//  Created by Philihp Busby on 2016-05-29.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

protocol FiltersDelegate {
    func delegateHandlingOfFiltersFromFilterController(filters: Filters)
}

class FiltersViewController: UITableViewController, SortDelegate, DistanceDelegate {

    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var dealSwitch: UISwitch!
    @IBOutlet weak var sortValue: UILabel!
    @IBOutlet weak var distanceValue: UILabel!
    
    var filters: Filters?
    
    var delegate: FiltersDelegate?
    
    @IBAction func cancelClicked(sender: AnyObject) {
        print("cancel")
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveClicked(sender: AnyObject) {
        delegate?.delegateHandlingOfFiltersFromFilterController(filters!)
        print("save")
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func dealSwitchToggled(sender: AnyObject) {
        filters!.deals = dealSwitch.on
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO: Load this from settings
        filters = Filters()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let sortController = segue.destinationViewController as? SortViewController {
            sortController.delegate = self
        }
        if let distanceController = segue.destinationViewController as? DistanceViewController {
            distanceController.delegate = self
        }
    }
    
    func delegateHandlingOfSortingFromSortController(sortBy: YelpSortMode) {
        filters?.sortBy = sortBy
        sortValue.text = sortBy.description
        self.tableView.reloadData()
    }
    
    func delegateHandlingOfDistanceFromDistanceController(distance: YelpDistanceMode) {
        filters?.distance = distance
        distanceValue.text = distance.description
        self.tableView.reloadData()
    }
    
    @IBAction func unwindToFilters(segue: UIStoryboardSegue) {
        // This could save me from having to write a delegate, but it's also annoying to cast.
        // if let sortVC = segue.sourceViewController as? SortViewController {
        //   print("\(sortVC.checkedIndex!.row)")
        // }
    }

}
