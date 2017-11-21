//
//  RestaurantListTableViewController.swift
//  Restaurants
//
//  Created by Ludovic Ollagnier on 13/11/2017.
//  Copyright © 2017 Ynov. All rights reserved.
//

import UIKit

class RestaurantListTableViewController: UITableViewController {

    let dir = Directory(demoData: true)

    override func viewDidLoad() {
        super.viewDidLoad()

        let notCenter = NotificationCenter.default
        notCenter.addObserver(forName: Notification.Name("ModelUpdated"), object: dir, queue: nil) { (notif) in
            print("Notif : \( notif.userInfo)")
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dir.list().count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "restoCell", for: indexPath)

        // Configure the cell...

        let currentResto = dir.list()[indexPath.row]
         cell.textLabel?.text = currentResto.name
        cell.detailTextLabel?.text = currentResto.address

        //Les cells sont recyclées, il faut y penser
        if indexPath.row%2 == 0 {
            cell.backgroundColor = UIColor.rouse
        } else {
            cell.backgroundColor = UIColor.white
        }

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showForm" {
            guard let destVC = segue.destination as? ViewController else { fatalError("bad type, expected ViewController") }
            destVC.dir = self.dir
        } else if segue.identifier == "showDetails" {

            guard let destVC = segue.destination as? RestoDetailsViewController else { fatalError("bad type, expected RestoDetailsViewController") }

            guard let cell = sender as? UITableViewCell else { return }
            guard let indexPath = tableView.indexPath(for: cell) else { return }

            let currentResto = dir.list()[indexPath.row]
            destVC.resto = currentResto
        }
    }

}
