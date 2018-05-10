//
//  playSetViewController.swift
//  iOSProject
//
//  Created by Carli Weinberg on 4/25/18.
//  Copyright © 2018 Carli Weinberg. All rights reserved.
//

import Foundation
import UIKit

class playSetViewController: UIViewController {
    var username =  ""
    var setsFound = 0
    var amountSelected = 0
    var cardsSelected = [card]()
    
    @IBOutlet weak var setFoundLabel: UILabel!
    @IBOutlet weak var cardLeftLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    var game = setGame()
    
    @IBAction func threeMoreButton(_ sender: Any) {
        if(game.cardsOnTable.count == 12) {
            game.threeMore()
            
            var buttonImg: UIImage
            buttonImg = game.cardsOnTable[12].pic
            cardButtons[12].setImage(buttonImg, for: .normal)
            
            var buttonImg2: UIImage
            buttonImg2 = game.cardsOnTable[13].pic
            cardButtons[13].setImage(buttonImg2, for: .normal)
            
            var buttonImg3: UIImage
            buttonImg3 = game.cardsOnTable[14].pic
            cardButtons[14].setImage(buttonImg3, for: .normal)
            } else {
                print("too many cards out")
            }
            updateView()
    }
    @IBOutlet weak var usernameLabel: UILabel!
    @IBAction func pressedButton(_ sender: Any) {
        
        let button = sender as! UIButton
 
        print(game.cardsOnTable[button.tag].name())
        cardsSelected.append(game.cardsOnTable[button.tag])
        
        if cardsSelected.count == 3 {
            print("there are three cards selected")
        }
        
//        if button.backgroundColor == UIColor.blue {
//            button.backgroundColor = UIColor.white
//            amountSelected = amountSelected - 1
//            let position = findImgInDeck(thePic: button.currentImage!, aDeck: cardsSelected)
//            cardsSelected.remove(at: position)
//        } else {
//            button.backgroundColor = UIColor.blue
//            amountSelected = amountSelected + 1
//            cardsSelected.append(game.cardsOnTable[button.tag])
//        }
        
//        if amountSelected == 3 {
//            if game.checkSet(one: cardsSelected[0], two: cardsSelected[1], three: cardsSelected[2]) {
//                print ("there is a set")
//                setsFound = setsFound + 1
//                let a = findImgInDeck(thePic: cardsSelected[0].pic, aDeck: game.cardsOnTable)
//                let b = findImgInDeck(thePic: cardsSelected[1].pic, aDeck: game.cardsOnTable)
//                let c = findImgInDeck(thePic: cardsSelected[2].pic, aDeck: game.cardsOnTable)
//                game.cardsOnTable.remove(at: a)
//                game.oneMore()
//                var buttonImg: UIImage
//                buttonImg = game.cardsOnTable[9].pic
//                cardButtons[a].setImage(buttonImg, for: .normal)
//
//                game.cardsOnTable.remove(at: b)
//                game.oneMore()
//                var buttonImg2: UIImage
//                buttonImg2 = game.cardsOnTable[10].pic
//                cardButtons[b].setImage(buttonImg2, for: .normal)
//
//                game.cardsOnTable.remove(at: c)
//                game.oneMore()
//                var buttonImg3: UIImage
//                buttonImg3 = game.cardsOnTable[11].pic
//                cardButtons[c].setImage(buttonImg3, for: .normal)
//                updateView()
//
//            } else {
//                print ("no set")
//                print(cardsSelected[0].name())
//                print(cardsSelected[1].name())
//                print(cardsSelected[2].name())
//                print("00000")
//            }
//            cardsSelected.removeAll()
//        }
        
    }
    
    override func viewDidLoad() {
        usernameLabel.text = username
        
//        print(game.cardsOnTable.count)
//        print(game.cardsInDeck.count)
//        print("----")
        
//        print(game.cardsOnTable.count)
//        print(game.cardsInDeck.count)

        game.startGame()
        for i in 0...(game.cardsOnTable.count-1) {
            var buttonImg: UIImage
            buttonImg = game.cardsOnTable[i].pic
            cardButtons[i].setImage(buttonImg, for: .normal)
        }
        updateView()
    }
    
    func findCardInStack(aCard: card, adeck: [card]) -> Int{
        for i in 0...adeck.count-1 {
            if adeck[i].theSame(one: aCard) {
                return i
            }
        }
        return -1
    }
    
    func findImgInDeck(thePic: UIImage, aDeck: [card]) -> Int {
        for i in 0...aDeck.count {
            if aDeck[i].pic == thePic {
                print("---")
                print(i)
                print("---")
                return i
            }
        }
        return -1
    }
    
    func updateView(){
        cardLeftLabel.text = String(game.cardsInDeck.count)
        setFoundLabel.text = String(setsFound)
        for card in cardButtons {
            card.backgroundColor = UIColor.white
        }
    }
}
