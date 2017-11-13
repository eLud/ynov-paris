//
//  UIColorExtension.swift
//  Restaurants
//
//  Created by Ludovic Ollagnier on 13/11/2017.
//  Copyright © 2017 Ynov. All rights reserved.
//

import UIKit

extension UIColor {

//    No stored properties !
//    var demo = 42

//    Computed static property (s'appel sur le type, et pas sur l'instance)
    static var rouse: UIColor {
        return UIColor(red: 1.0, green: 0.078, blue: 0.576, alpha: 1)
    }

    func stronger() -> UIColor {
        return self
    }

}
