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
    
    

    @IBAction func purpleButtonPressed(_ sender: Any) {
        colorOn = "Purple"
        print(colorOn)
        print("should be purple")
    }
    
    @IBAction func greenButtonPressed(_ sender: Any) {
        colorOn = "Green"
        print(colorOn)
        print("should be green")
        
    }

    @IBAction func redButtonPressed(_ sender: Any) {
        colorOn = "Red"
        print(colorOn)
        print("should be red")
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        print("the color uppppp here is \(colorOn)")
        if segue.destination is checkColorViewController
        {
            print("the color in here is \(colorOn)")
            let vc = segue.destination as? checkColorViewController
            vc?.colorOn = colorOn
        }
    
}
}
