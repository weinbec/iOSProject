//
//  checkSetViewController.swift
//  iOSProject
//
//  Created by Carli Weinberg on 4/17/18.
//  Copyright © 2018 Carli Weinberg. All rights reserved.
//
import UIKit

class checkSetViewController: UIViewController {
    var colorOn = ""
    override func viewDidLoad() {
    
     super.viewDidLoad()
        print("hi one")
    }
    
    
    @IBAction func greenButtonPressed(_ sender: Any) {
        colorOn = "Green"
        print("set to green")

    }
    
    @IBAction func purpleButtonPressed(_ sender: Any) {
        colorOn = "Purple"
        print("set to purple")
    }
    
    @IBAction func redButtonPressed(_ sender: Any) {
        colorOn = "Red"
        print("set to red")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is checkColorViewController
        {
            let vc = segue.destination as? checkColorViewController
            vc?.colorOn = colorOn
        }
    
}
}
