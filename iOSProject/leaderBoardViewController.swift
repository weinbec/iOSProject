//
//  leaderBoardViewController.swift
//  iOSProject
//
//  Created by Carli Weinberg on 5/14/18.
//  Copyright © 2018 Carli Weinberg. All rights reserved.
//

import UIKit
import Firebase

class leaderBoardViewController: UIViewController {
    var setCollectionRef: CollectionReference!
    var setListerner: ListenerRegistration!
    
    var gameDataArray = [gameSession]()
    
    @IBOutlet var userList: [UILabel]!
    @IBOutlet var scoreList: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionRef = Firestore.firestore().collection("setGame")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showAll()
    }
    
    func showAll (){
        self.gameDataArray.removeAll()
        
        setListerner = setCollectionRef.order(by: "score", descending: true).limit(to: 10).addSnapshotListener({ (querySnapshot, error) in
            guard let snapshot = querySnapshot else {
                print("Error fetching quotes")
                return
            }
            snapshot.documentChanges.forEach{(docChange) in
                    self.quoteAdded(docChange.document)

            }
            self.gameDataArray.sort(by: { (mq1, mq2) -> Bool in
                return mq1.score > mq2.score
            })
         
            for i in 0...self.gameDataArray.count-1 {
                self.userList[i].text = self.gameDataArray[i].username
                self.scoreList[i].text = self.gameDataArray[i].score
            }
        })
    }
    
    func findTag(){
        
    }
    
    func quoteAdded(_ document: DocumentSnapshot){
        let newPhotoBucket = gameSession(documentSnapshot: document)
        gameDataArray.append(newPhotoBucket)
    }

}
