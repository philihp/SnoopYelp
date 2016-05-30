//
//  YelpSortEnum.swift
//  Yelp
//
//  Created by Philihp Busby on 2016-05-30.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import Foundation

enum YelpSortMode: Int {
    case BestMatched = 0, Distance, HighestRated
    
    var description: String {
        switch self {
        case .BestMatched:
            return "Best Matched"
        case .Distance:
            return "Distance"
        case .HighestRated:
            return "Highest Rated"
        }
    }
}