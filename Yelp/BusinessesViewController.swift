//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UISearchBarDelegate, FiltersDelegate {

    @IBOutlet weak var tableView: UITableView!
    var businesses: BusinessList!
    
    var searchController: UISearchController!
    var searchBar: UISearchBar?
    var searchText: String = "Restaurants"
    
    var filters: Filters = Filters()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup Searchbar
        searchBar = UISearchBar()
        searchBar!.placeholder = "Restaurants"
        searchBar!.sizeToFit()
        searchBar!.delegate = self
        navigationItem.titleView = searchBar
        
        // Setup TableView
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 128
        
        refreshSearch()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        // print("searchBar: \(searchText)")
        self.searchText = (searchText == "") ? "Restaurants" : searchText
        refreshSearch()
    }
    
    func delegateHandlingOfFiltersFromFilterController(filters: Filters) {
        self.filters = filters
        filters.saveToDisk()
        refreshSearch()
    }
    
    func refreshSearch() {
        print("Cats: \(filters.categories)")
        
        Business.searchWithTerm(searchText,
                                sort: filters.sortBy,
                                categories: filters.categories,
                                deals: filters.deals,
                                distance: filters.distance,
                                completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = BusinessList(businesses)
            self.tableView.dataSource = self.businesses
            self.tableView.delegate = self.businesses
            self.tableView.reloadData()
        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let navigationController = segue.destinationViewController as? UINavigationController
        let filtersController = navigationController?.topViewController as? FiltersViewController
        
        if let filtersController = filtersController {
            filtersController.delegate = self
        }
    }

}
