//
//  checkColorViewController.swift
//  iOSProject
//
//  Created by Carli Weinberg on 4/17/18.
//  Copyright © 2018 Carli Weinberg. All rights reserved.
//

import Foundation
import UIKit

class checkColorViewController: UIViewController {
     var colorOn:String = ""
    
    
    @IBOutlet var cardButton: [UIButton]!
    
    @IBAction func cardButtonPressed(_ sender: Any) {
        print("button pressed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(colorOn )
        print("made it")
        if colorOn == "Green" {
//            var aImage: UIImage
//          // aImage = #imageLiteral(resourceName: "OneGreenDiamondEmpty.png")
//            cardButton[0].setImage(aImage, for: .normal)
           // print("green")
        }
    }
    
}
