//
//  loginViewController.swift
//  iOSProject
//
//  Created by Carli Weinberg on 4/25/18.
//  Copyright © 2018 Carli Weinberg. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import Rosefire
import GoogleSignIn

class loginViewController: UIViewController, GIDSignInUIDelegate {
    let rosefireRegistryToken = "49020ea9-a055-4595-8cc9-6b9b5cdbdf29"

    @IBOutlet weak var usernameTextField: UITextField!
    var username = ""
    
    override func viewDidLoad() {
        print("in login")
        
    }
    
    func loginCompletionCallback(_ user: User?, _ error:Error?) {
        if let error = error {
            print("Error during log in \(error.localizedDescription)")
            let ac = UIAlertController(title: "Login Failed", message: error.localizedDescription, preferredStyle: .alert)      ////// to show error message to user
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(ac, animated:true)                                                                                                  ///show error message to user
        }else {
            appDelegate.handleLogin()
        }
    }
    
    @IBAction func roseFireLogin(_ sender: Any) {
        print("rosefirelogin")
        Rosefire.sharedDelegate().uiDelegate = self
        Rosefire.sharedDelegate().signIn(registryToken: rosefireRegistryToken) {
            (error, result) in
            if error != nil {
                print("error communicting with rosefire!")
                return
            } else {
                print("you are now signed in with rose fire")
                Auth.auth().signIn(withCustomToken: result!.token, completion: self.loginCompletionCallback)
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is playSetViewController
        {
            username = usernameTextField.text!
            let vc = segue.destination as? playSetViewController
            vc?.username = username
        }
        
    }
}
