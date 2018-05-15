//
//  DirectionsViewController.swift
//  iOSProject
//
//  Created by Carli Weinberg on 5/9/18.
//  Copyright © 2018 Carli Weinberg. All rights reserved.
//

import UIKit

class DirectionsViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url : NSURL! = NSURL(string: "https://www.setgame.com/sites/default/files/instructions/SET%20INSTRUCTIONS%20-%20ENGLISH.pdf")
        
        
        webView.loadRequest(NSURLRequest(url: url as URL) as URLRequest)
        
    }
}

