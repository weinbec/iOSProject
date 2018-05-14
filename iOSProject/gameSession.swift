//
//  gameSession.swift
//  iOSProject
//
//  Created by Carli Weinberg on 5/14/18.
//  Copyright © 2018 Carli Weinberg. All rights reserved.
//
import UIKit
import Firebase

class gameSession: NSObject {
    
    var id: String?
    var username: String
    var score: String

    
    init(username: String, score: String) {
       self.username = username
        self.score = score
    }
    
    init(documentSnapshot: DocumentSnapshot) {
        self.id = documentSnapshot.documentID
        let data = documentSnapshot.data()!
        if data["score"] != nil {
            self.score = data["score"] as! String
        } else {
            self.score = "none"
        }
        
        if data["username"] != nil {
            self.username = data["username"] as! String
        } else {
            self.username = ""
        }
    }
    var data: [String: Any] {
        return ["username": self.username,
                "score": self.score]
    }
    
}
