//
//  loginViewController.swift
//  iOSProject
//
//  Created by Carli Weinberg on 4/25/18.
//  Copyright © 2018 Carli Weinberg. All rights reserved.
//

import Foundation
import UIKit

class loginViewController: UIViewController {


    @IBOutlet weak var usernameTextField: UITextField!
    var username = ""
    
    override func viewDidLoad() {
        print("in login")
        
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
