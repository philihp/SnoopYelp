//
//  Filter.swift
//  Yelp
//
//  Created by Philihp Busby on 2016-05-29.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

struct Filters {
    var categories: [String]?
    var sortBy: YelpSortMode?
    var distance: YelpDistanceMode?
    var deals: Bool = false
}
