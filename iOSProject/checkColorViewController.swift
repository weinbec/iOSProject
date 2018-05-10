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
     var colorOn: String?
    // var theObj = checkSet()
    
    
    @IBOutlet var cardButton: [UIButton]!
    
    @IBAction func cardButtonPressed(_ sender: Any) {
        print("button pressed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(colorOn)
        
//        if colorOn == "Green" {
//            let bigDeck = deck()
//            var greenDeck = [card]()
//            greenDeck.append(bigDeck.cards[20])
//            var buttonImg = greenDeck[0].pic
//            cardButton[0].setImage(buttonImg, for: .normal)
////            for i in 0...bigDeck.cards.count-1 {
////                if bigDeck.cards[i].color == "Green" {
////                    greenDeck.append(bigDeck.cards[i])
////                }
////            }
////
////            for i in 0...cardButton.count-1 {
////                var buttonImg: UIImage
////                buttonImg = greenDeck[i].pic
////                cardButton[i].setImage(buttonImg, for: .normal)
////            }
//
//
//        }
//        if colorOn == "Red" {
//            cardButton[0].setTitle("red", for: .normal)
//        }
//        if colorOn == "Purple" {
//            cardButton[0].setTitle("purple", for: .normal)
//        }
    }
    
}
