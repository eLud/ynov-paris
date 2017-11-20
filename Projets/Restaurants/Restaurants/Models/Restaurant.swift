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

    init(name: String, address: String, style: RestaurantStyle, visited: Bool, grade: Int) {

        self.name = name
        self.address = address
        self.isVisited = visited
        self.style = style
        self.note = grade

        latitude = 0
        longitude = 0
    }

    var latitude: Double
    var longitude: Double
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
