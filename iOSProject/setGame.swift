//
//  setGame.swift
//  iOSProject
//
//  Created by Carli Weinberg on 4/25/18.
//  Copyright © 2018 Carli Weinberg. All rights reserved.
//

import Foundation

class setGame {
  
    var theDeck: deck
    var gameState: GameState
    var cardsOnTable: [card]
    var cardsInDeck: [card]
    
    
    enum GameState : String{
        case done
        case playing
    }
    
    init() {
        self.gameState = .playing
        self.theDeck =  deck()
        self.cardsOnTable = []
        self.cardsInDeck = theDeck.cards
    }
    
   func pressedButton(){
    
    }
    
    
    func startGame(){
        
        for _ in 0...11 {
            let amount = self.cardsInDeck.count
            let num = Int(arc4random_uniform(UInt32(amount)))
            cardsOnTable.append(self.cardsInDeck[num])
            cardsInDeck.remove(at: num)
        }
    }
    
    func threeMore(){
        for _ in 0...2 {
            let num = Int(arc4random_uniform(UInt32(self.cardsInDeck.count)))
            cardsOnTable.append(self.cardsInDeck[num])
            cardsInDeck.remove(at: num)
        }
    }
    
    func oneMore() -> card{
        let num = Int(arc4random_uniform(UInt32(self.cardsInDeck.count)))
        let theCard = cardsInDeck[num]
        cardsOnTable.append(theCard)
        cardsInDeck.remove(at: num)
        return theCard
    }
    
    
    func checkSet(one: card, two: card, three: card) -> Bool{
        var colorVar = false
        var shapeVar = false
        var fillVar = false
        var numVar = false
        if one.color == two.color && one.color == three.color && two.color == three.color {
            colorVar = true
        }
        else if one.color != two.color && one.color != three.color && two.color != three.color {
            colorVar = true
        }
        
        if one.shape == two.shape && one.shape == three.shape && two.shape == three.shape {
            shapeVar = true
        }
        else if one.shape != two.shape && one.shape != three.shape && two.shape != three.shape {
            shapeVar = true
        }
        
        if one.fill == two.fill && one.fill == three.fill && two.fill == three.fill {
            fillVar = true
        }
        else if one.fill != two.fill && one.fill != three.fill && two.fill != three.fill {
            fillVar = true
        }
        
        if one.num == two.num && one.num == three.num && two.num == three.num {
            numVar = true
        }
        else if one.num != two.num && one.num != three.num && two.num != three.num {
            numVar = true
        }
        
        return colorVar && shapeVar && fillVar && numVar
    }
    
    func checkSetInGroup(theDeck: [card]) -> Bool{
        for i in 0...cardsOnTable.count {
            for j in 0...cardsOnTable.count{
                for k in 0...cardsOnTable.count{
                    if checkSet(one: cardsOnTable[i], two: cardsOnTable[j], three: cardsOnTable[k]) {
                        return true
                    }
                }
            }
        }
        return false
    }
    
    
}
