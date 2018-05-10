//
//  card.swift
//  iOSProject
//
//  Created by Carli Weinberg on 4/25/18.
//  Copyright © 2018 Carli Weinberg. All rights reserved.
//

import Foundation
import UIKit

class card {

    var pic : UIImage
    var color: String
    var num: Int
    var shape: String
    var fill: String
    
    init(pic: UIImage, color: String, num: Int, shape: String, fill: String) {
        self.pic = pic
        self.color = color
        self.num = num
        self.shape = shape
        self.fill = fill
    }
    
    func theSame(one: card) -> Bool{
        if self.pic == one.pic {
            return true
        } else{
            return false
        }
    }

    func name() -> String{
        return color + shape + fill
    }
}
