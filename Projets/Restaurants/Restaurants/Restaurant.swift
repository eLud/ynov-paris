//
//  Restaurant.swift
//  Restaurants
//
//  Created by Ludovic Ollagnier on 07/11/2017.
//  Copyright © 2017 Ynov. All rights reserved.
//

import Foundation

enum RestaurantStyle: Int {
    case chinese
    case burger
    case vegan
    case other
}

struct Restaurant: Equatable {

    var name: String
    var address: String
    var style: RestaurantStyle
    var note: Int
    var isVisited: Bool

    mutating func grade(_ note: Int) {
        self.note = note
        isVisited = true
    }

    public static func ==(lhs: Restaurant, rhs: Restaurant) -> Bool {
        return lhs.name == rhs.name && lhs.address == rhs.address
    }
}
