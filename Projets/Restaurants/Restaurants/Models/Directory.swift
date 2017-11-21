//
//  Directory.swift
//  Restaurants
//
//  Created by Ludovic Ollagnier on 07/11/2017.
//  Copyright © 2017 Ynov. All rights reserved.
//

import Foundation

protocol Mappable {
    var latitude: Double { get }
    var longitude: Double { get }

    var title: String { get set }
}

class Directory: Codable {

    //    var restos: Array<Restaurant> = []
    //    var restos = [Restaurant]()
    private var restos: [Restaurant]

    init(demoData: Bool = false) {
        restos = []
        if demoData {
            for i in 0...20 {
                let r = Restaurant(name: "Resto \(i)", address: "Adress \(i)", style: .chinese, visited: false, grade: 0)

                restos.append(r)
            }
        }
    }

    func add(_ newRestaurant: Restaurant) {
        restos.append(newRestaurant)
        notifyChanges(restoName: newRestaurant.name)

        let prefs = UserDefaults.standard
        prefs.set(newRestaurant.name, forKey: "lastResto")

        save()
    }

    func list() -> [Restaurant] {
        return restos
    }

    func remove(_ restaurant: Restaurant) {

        if let index = restos.index(of: restaurant) {
            remove(at: index)
            notifyChanges(restoName: restaurant.name)
        } else {
            print("Resto not in array")
        }
    }

    func remove(at index: Int) {
        restos.remove(at: index)
    }

    private func notifyChanges(restoName: String) {
        let notCenter = NotificationCenter.default
        notCenter.post(name: Notification.Name("ModelUpdated"), object: self, userInfo: ["restoName" : restoName])
    }

    private func save() {

        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(self)
            let dataStr = String(data: data, encoding: .utf8)
            print(dataStr!)

            let fm = FileManager.default
            var url = fm.urls(for: .documentDirectory, in: .userDomainMask).first!
            url.appendPathComponent("directory.json")
            print(url)

            try data.write(to: url)
        } catch {
            print(error.localizedDescription)
        }
    }

    private func parse(data: Data) {

        if let dir = try? JSONDecoder().decode(Directory.self, from: data) {
            print(dir.list().last?.name)
        }
    }
}





