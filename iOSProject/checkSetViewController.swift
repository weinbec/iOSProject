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
    
    }
    
    

    @IBOutlet weak var countLabel: UILabel!
    
    @IBAction func purpleButtonPressed(_ sender: Any) {
        colorOn = "Purple"
        performSegue(withIdentifier: "checkIdSegue", sender: sender)
    }
    
    @IBAction func greenButtonPressed(_ sender: Any) {
        colorOn = "Green"
 
        performSegue(withIdentifier: "checkIdSegue", sender: sender)
        
    }

    @IBAction func redButtonPressed(_ sender: Any) {
        colorOn = "Red"
        performSegue(withIdentifier: "checkIdSegue", sender: sender)
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is checkColorViewController
        {
            print("the color in here is \(colorOn)")
            let vc = segue.destination as? checkColorViewController
            vc?.colorOn = colorOn
        }
    
}
}
