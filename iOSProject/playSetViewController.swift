//
//  playSetViewController.swift
//  iOSProject
//
//  Created by Carli Weinberg on 4/25/18.
//  Copyright © 2018 Carli Weinberg. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import GoogleSignIn

class playSetViewController: UIViewController {
    var username =  ""
    var setsFound = 0
    var amountSelected = 0
    var cardsSelected = [card]()
    var timeCount = 20
    
    @IBOutlet weak var timerLabel: UILabel!
   var gameTimer: Timer!
    @IBOutlet weak var setFoundLabel: UILabel!
    @IBOutlet weak var cardLeftLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    var game = setGame()
    
    var setCollectionRef: CollectionReference!
    var setListener: ListenerRegistration!
    
    
    @IBAction func threeMoreButton(_ sender: Any) {
       
            if(game.cardsOnTable.count == 12) {
                cardButtons[12].setImage(game.oneMore().pic, for: .normal)
                cardButtons[13].setImage(game.oneMore().pic, for: .normal)
                cardButtons[14].setImage(game.oneMore().pic, for: .normal)

        }
    }
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBAction func pressedButton(_ sender: Any) {
        
        let button = sender as! UIButton
 
        print(findCardFromButton(aButton: button).name())
        
        
        if button.backgroundColor == UIColor.blue {
            button.backgroundColor = UIColor.white
            if cardsSelected[0].theSame(one: findCardFromButton(aButton: button)) {
                cardsSelected.remove(at: 0)
            } else if cardsSelected[1].theSame(one: findCardFromButton(aButton: button)) {
                cardsSelected.remove(at: 1)
            } else if cardsSelected[2].theSame(one: findCardFromButton(aButton: button)) {
                cardsSelected.remove(at: 2)
            } else{
                print("error removing selected card \(button.tag)")
            }
        } else {
            button.backgroundColor = UIColor.blue
            cardsSelected.append(findCardFromButton(aButton: button))
        }
        
        
        if cardsSelected.count == 3 {
            findButtonOfCard(aCard: cardsSelected[0]).backgroundColor = UIColor.white
            findButtonOfCard(aCard: cardsSelected[1]).backgroundColor = UIColor.white
            findButtonOfCard(aCard: cardsSelected[2]).backgroundColor = UIColor.white
            print("there are three cards selected")
            print(cardsSelected[0].name() + cardsSelected[1].name() + cardsSelected[2].name())
            if game.checkSet(one: cardsSelected[0], two: cardsSelected[1], three: cardsSelected[2]) {
                setsFound = setsFound + 1
                print("yes a set")
                let first = findButtonOfCard(aCard: cardsSelected[0])
                let second = findButtonOfCard(aCard: cardsSelected[1])
                let third = findButtonOfCard(aCard: cardsSelected[2])
                game.cardsOnTable.remove(at: findCardInStack(aCard: cardsSelected[0], adeck: game.cardsOnTable))
                game.cardsOnTable.remove(at: findCardInStack(aCard: cardsSelected[1], adeck: game.cardsOnTable))
                game.cardsOnTable.remove(at: findCardInStack(aCard: cardsSelected[2], adeck: game.cardsOnTable))
                first.setImage(game.oneMore().pic, for: UIControlState.normal)
                second.setImage(game.oneMore().pic, for: UIControlState.normal)
                third.setImage(game.oneMore().pic, for: UIControlState.normal)
                if game.checkSetInGroup(theDeck: game.cardsOnTable){
                    
                } else {
                    print("print THERE IS NO SET IN HERE")
                }
                print("got hereee")
            } else {
                print("no")
            }
            cardsSelected.removeAll()
        }
        
        cardLeftLabel.text = String(game.cardsInDeck.count)
        setFoundLabel.text = String(setsFound)
        print(game.cardsOnTable.count)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.text = username
        game.startGame()
        for i in 0...(game.cardsOnTable.count-1) {
            var buttonImg: UIImage
            buttonImg = game.cardsOnTable[i].pic
            cardButtons[i].setImage(buttonImg, for: .normal)
        }
        if game.checkSetInGroup(theDeck: game.cardsOnTable){
            
        } else {
            print("print THERE IS NO SET IN HERE")
        }
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerFunc), userInfo: nil, repeats: true)
        
        updateView()
    }
    
    @objc func timerFunc(){
      
        if timeCount == 0 {
            gameTimer.invalidate()
            gameOver()
        } else {
            timeCount = timeCount - 1
            timerLabel.text = "Time: \(timeCount)"
        }
    }
    
    func gameOver(){
        let alertController = UIAlertController(title:"Game Over", message: "Score: \(setsFound)", preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (action) in
            print("You pressed Cancel")
            
        }
        alertController.addAction(cancelAction)
        alertController.addTextField { (textField) in
            textField.placeholder = "Name for High Score"
        }
        //////////
        let createPhotoAction = UIAlertAction(title: "Submit Score", style: UIAlertActionStyle.default) { (action) in
            self.setCollectionRef = Firestore.firestore().collection("setGame")
           let captionTextField = alertController.textFields![0]
            let newGameSession = gameSession(username: captionTextField.text!, ////username
                score: "\(self.setsFound)")
            
            self.setCollectionRef.addDocument(data: newGameSession.data)
            
        }
        //////////
        alertController.addAction(createPhotoAction)
        present(alertController, animated: true, completion: nil)
//        setCollectionRef = Firestore.firestore().collection("setGame")
//        let newGameSession = gameSession(username: (Auth.auth().currentUser?.uid)!, ////username
//                                         score: "\(setsFound)")
//
//        self.setCollectionRef.addDocument(data: newGameSession.data)
    }
    
    func findButtonOfCard(aCard: card) -> UIButton {
        for j in 0...cardButtons.count - 1 {
            if cardButtons[j].currentImage == aCard.pic {
                return cardButtons[j]
            }
        }
        print("error returning button of card")
        return cardButtons[0]
    }
    
    func findCardFromButton(aButton: UIButton) -> card{         ////return the card that is on this button
        for i in 0...game.cardsOnTable.count-1 {
            if aButton.currentImage == game.cardsOnTable[i].pic {
                return game.cardsOnTable[i]
            }
        }
        print("error findCardFromButton")
        return game.cardsOnTable[0]
    }
    
    func findCardInStack(aCard: card, adeck: [card]) -> Int{
        for i in 0...adeck.count-1 {
            if adeck[i].theSame(one: aCard) {
                return i
            }
        }
        return -1
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        appDelegate.handleLogout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }
    
    @objc func updateView(){
        cardLeftLabel.text = String(game.cardsInDeck.count)
        setFoundLabel.text = String(setsFound)
        for card in cardButtons {
            card.backgroundColor = UIColor.white
        }
    }
}
