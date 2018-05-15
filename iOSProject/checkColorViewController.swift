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
        let button = sender as! UIButton
    }
    
    @IBAction func pressedDone(_ sender: Any) {
        print("Done action")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = colorOn
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var displayDeck: [card] = []

        if colorOn == "Green" {
            displayDeck = findColorCards(color: colorOn!)
        }
        if colorOn == "Red" {
          displayDeck = findColorCards(color: colorOn!)
        }
        if colorOn == "Purple" {
           displayDeck = findColorCards(color: colorOn!)
        }
        for j in 0...cardButton.count-1 {
            cardButton[j].setImage(displayDeck[j].pic, for: UIControlState.normal)
        }
    }
    
    func findColorCards(color: String) -> [card]{
        let myDeck = deck()
        var returnCards: [card] = []
        for i in 0...myDeck.cards.count-1{
            if myDeck.cards[i].color == color{
                returnCards.append(myDeck.cards[i])
            }
        }
        return returnCards
    }
    
}
