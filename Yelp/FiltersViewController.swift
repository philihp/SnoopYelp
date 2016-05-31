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
    @IBOutlet weak var categoryTableView: CategoryTableView!
    
    var filters: Filters?
    
    var delegate: FiltersDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // These are internally loaded from settings
        filters = Filters()
        
        // Now set them to their inputs
        if let deals = filters?.deals {
            dealSwitch.on = deals
        }
        if let distance = filters?.distance {
            distanceValue.text = distance.description
        }
        if let sort = filters?.sortBy {
            sortValue.text = sort.description
        }
        
        categoryTableView.delegate = categoryTableView
        categoryTableView.dataSource = categoryTableView
    }
    
    @IBAction func cancelClicked(sender: AnyObject) {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveClicked(sender: AnyObject) {
        delegate?.delegateHandlingOfFiltersFromFilterController(filters!)
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func dealSwitchToggled(sender: AnyObject) {
        filters!.deals = dealSwitch.on
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
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
    }

}
