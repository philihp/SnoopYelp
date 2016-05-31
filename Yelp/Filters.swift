//
//  Filter.swift
//  Yelp
//
//  Created by Philihp Busby on 2016-05-29.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

struct Filters {
    
    static let defaults = NSUserDefaults.standardUserDefaults()
    
    var categories: [String] {
        get {
            let defaults = NSUserDefaults.standardUserDefaults()
            var categories: [String] = []
            Categories.data.forEach { category in
                if let code = category["code"] {
                    let setting = defaults.boolForKey("snoop.yelp.categories.\(code)")
                    print("CAT: \(code) \t-> \(setting)")
                    if setting {
                        categories.append(code)
                    }
                }
            }
            return categories
        }
    }
    var sortBy: YelpSortMode?
    var distance: YelpDistanceMode?
    var deals: Bool = false
    
    let CATEGORY_KEY = "snoop.yelp.categories"
    let SORT_KEY = "snoop.yelp.sort"
    let DISTANCE_KEY = "snoop.yelp.distance"
    let DEALS_KEY = "snoop.yelp.deals"
    
    init() {
        self.sortBy = YelpSortMode(rawValue: Filters.defaults.integerForKey(SORT_KEY))
        self.distance = YelpDistanceMode(rawValue: Filters.defaults.integerForKey(DISTANCE_KEY))
        self.deals = Filters.defaults.boolForKey(DEALS_KEY)
        // no need to get categories, the getter will pull these when it needs to
    }
    
    func saveToDisk() {
        Filters.defaults.setBool(deals, forKey: DEALS_KEY)
        if let sortByValue = sortBy?.rawValue {
            Filters.defaults.setInteger(sortByValue, forKey: SORT_KEY)
        }
        if let distanceValue = distance?.rawValue {
            Filters.defaults.setInteger(distanceValue, forKey: DISTANCE_KEY)
        }
        // no need to save categories, they're saved individually
        Filters.defaults.synchronize()
    }
    
}
