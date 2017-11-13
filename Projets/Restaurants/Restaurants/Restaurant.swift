//
//  Restaurant.swift
//  Restaurants
//
//  Created by Ludovic Ollagnier on 07/11/2017.
//  Copyright © 2017 Ynov. All rights reserved.
//

enum RestaurantStyle: Int {
    case chinese
    case burger
    case vegan
    case other
}

struct Restaurant: Equatable, Mappable {

    var latitude: Double = 0.0
    var longitude: Double = 0.0
    var title: String {
        get {
            return name
        }

        set {
            name = newValue
        }
    }

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
