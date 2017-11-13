//
//  Directory.swift
//  Restaurants
//
//  Created by Ludovic Ollagnier on 07/11/2017.
//  Copyright © 2017 Ynov. All rights reserved.
//

class Directory {

    //    var restos: Array<Restaurant> = []
    //    var restos = [Restaurant]()
    private var restos: [Restaurant] = []

    func add(_ newRestaurant: Restaurant) {
        restos.append(newRestaurant)
    }

    func list() -> [Restaurant] {

        for r in restos {
            print(r.name)
        }

        return restos
    }

    func remove(_ restaurant: Restaurant) {

        if let index = restos.index(of: restaurant) {
            remove(at: index)
        } else {
            print("Resto not in array")
        }
    }

    func remove(at index: Int) {
        restos.remove(at: index)
    }
}
