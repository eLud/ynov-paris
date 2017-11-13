//
//  ViewController.swift
//  Restaurants
//
//  Created by Ludovic Ollagnier on 07/11/2017.
//  Copyright © 2017 Ynov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var styleSegmentedControl: UISegmentedControl!
    @IBOutlet weak var isVisitedSwitch: UISwitch!
    @IBOutlet weak var gradeSlider: UISlider!
    @IBOutlet weak var sliderValueLabel: UILabel!

    let dir = Directory()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sliderValueDidChange(_ sender: UISlider) {

        let floatValue = sender.value
        let intValue = Int(floatValue)
        sliderValueLabel.text = "\(intValue)"
        sender.value = Float(intValue)
    }

    @IBAction func cancel(_ sender: Any) {
    }

    @IBAction func save(_ sender: Any) {

//        if let name = nameTextField.text, let address = addressTextField.text {
//
//        }

        guard let name = nameTextField.text else { return }
        guard let address = addressTextField.text else { return }
        guard name.characters.count > 2 else { return }

        let index = styleSegmentedControl.selectedSegmentIndex
        guard let style = RestaurantStyle(rawValue: index) else { fatalError("Index out of RestaurantStyle bounds") }

        let isVisited = isVisitedSwitch.isOn
        let grade = Int(gradeSlider.value)

        let resto = Restaurant(name: name, address: address, style: style, note: grade, isVisited: isVisited)

        dir.add(resto)
        dir.list()
    }
}







