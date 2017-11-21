//
//  RestoDetailsViewController.swift
//  Restaurants
//
//  Created by Ludovic Ollagnier on 20/11/2017.
//  Copyright © 2017 Ynov. All rights reserved.
//

import UIKit
import MapKit

class RestoDetailsViewController: UIViewController {

    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!

    var resto: Restaurant?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let r = resto else { fatalError("No resto provided")}
        configure(with: r)
    }

    private func configure(with restaurant: Restaurant) {

        title = restaurant.name
        nameLabel.text = restaurant.name
        addressLabel.text = restaurant.address

        let prefs = UserDefaults.standard
        let lastResto = prefs.string(forKey: "lastResto")
        title = lastResto
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
