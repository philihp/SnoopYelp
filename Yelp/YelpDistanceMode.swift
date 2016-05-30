//
//  YelpSortEnum.swift
//  Yelp
//
//  Created by Philihp Busby on 2016-05-30.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import Foundation

enum YelpDistanceMode: Int {
    case Walking = 0, Biking, Driving
    
    var description: String {
        switch self {
        case .Walking:
            return "Walking"
        case .Biking:
            return "Biking"
        case .Driving:
            return "Driving"
        }
    }
    
    var details: String {
        switch self {
        case .Walking:
            return "0.2 miles"
        case .Biking:
            return "2 miles"
        case .Driving:
            return "20 miles"
        }
    }
    
    var distance: Int {
        switch self {
        case .Walking:
            return 322 // 0.2 miles in meters
        case .Biking:
            return 3218 // 2 miles in meters
        case .Driving:
            return 32187 // 20 miles in meters
        }
    }
    
}