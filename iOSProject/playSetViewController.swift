//
//  playSetViewController.swift
//  iOSProject
//
//  Created by Carli Weinberg on 4/25/18.
//  Copyright © 2018 Carli Weinberg. All rights reserved.
//

import Foundation
import UIKit

class playSetViewController: UIViewController {
    var username =  ""
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    override func viewDidLoad() {
        let OneGreenDiamondFull = #imageLiteral(resourceName: "OneGreenDiamondFull.png")
        let OneGreenDiamondEmpty = #imageLiteral(resourceName: "OneGreenDiamondEmpty.png")
        let OneGreenDiamondLined = #imageLiteral(resourceName: "OneGreenDiamondLined.png")
                let OneGreenOvalFull = #imageLiteral(resourceName: "OneGreenOvalFull.png")
                let OneGreenOvalEmpty = #imageLiteral(resourceName: "OneGreenOvalEmpty.png")
                let OneGreenOvalLined = #imageLiteral(resourceName: "OneGreenOvalLined.png")
               let OneGreenSFull = #imageLiteral(resourceName: "OneGreenSFull.png")
                let OneGreenSEmpty = #imageLiteral(resourceName: "OneGreenSEmpty.png")
                let OneGreenSLined = #imageLiteral(resourceName: "OneGreenSLined.png")
                let OneRedDiamondFull = #imageLiteral(resourceName: "OneRedDiamondFull.png")
                let OneRedDiamondEmpty = #imageLiteral(resourceName: "OneRedDiamondEmpty.png")
                let OneRedDiamondLined = #imageLiteral(resourceName: "OneRedDiamondLined.png")
                        let OneRedOvalFull = #imageLiteral(resourceName: "OneRedOvalFull.png")
                        let OneRedOvalEmpty = #imageLiteral(resourceName: "OneRedOvalEmpty.png")
                        let OneRedOvalLined = #imageLiteral(resourceName: "OneRedOvalLined.png")
                       let OneRedSFull = #imageLiteral(resourceName: "OneRedSFull.png")
                        let OneRedSEmpty = #imageLiteral(resourceName: "OneRedSEmpty.png")
                        let OneRedSLined = #imageLiteral(resourceName: "OneRedSLined.png")
                let OnePurpleDiamondFull = #imageLiteral(resourceName: "OnePurpleDiamondFull.png")
                let OnePurpleDiamondEmpty = #imageLiteral(resourceName: "OnePurpleDiamondEmpty.png")
                let OnePurpleDiamondLined = #imageLiteral(resourceName: "OnePurpleDiamondLined.png")
                        let OnePurpleOvalFull = #imageLiteral(resourceName: "OnePurpleOvalFull.png")
                        let OnePurpleOvalEmpty = #imageLiteral(resourceName: "OnePurpleOvalEmpty.png")
                        let OnePurpleOvalLined = #imageLiteral(resourceName: "OnePurpleOvalLined.png")
                       let OnePurpleSFull = #imageLiteral(resourceName: "OnePurpleSFull.png")
                        let OnePurpleSEmpty = #imageLiteral(resourceName: "OnePurpleSEmpty.png")
                        let OnePurpleSLined = #imageLiteral(resourceName: "OnePurpleSLined.png")
        
                let TwoGreenDiamondFull = #imageLiteral(resourceName: "TwoGreenDiamondFull.png")
                let TwoGreenDiamondEmpty = #imageLiteral(resourceName: "TwoGreenDiamondEmpty.png")
                let TwoGreenDiamondLined = #imageLiteral(resourceName: "TwoGreenDiamondLined.png")
                        let TwoGreenOvalFull = #imageLiteral(resourceName: "TwoGreenOvalFull.png")
                        let TwoGreenOvalEmpty = #imageLiteral(resourceName: "TwoGreenOvalEmpty.png")
                        let TwoGreenOvalLined = #imageLiteral(resourceName: "TwoGreenOvalLined.png")
                       let TwoGreenSFull = #imageLiteral(resourceName: "TwoGreenSFull.png")
                        let TwoGreenSEmpty = #imageLiteral(resourceName: "TwoGreenSEmpty.png")
                        let TwoGreenSLined = #imageLiteral(resourceName: "TwoGreenSLined.png")
                        let TwoRedDiamondFull = #imageLiteral(resourceName: "TwoRedDiamondFull.png")
                        let TwoRedDiamondEmpty = #imageLiteral(resourceName: "TwoRedDiamondEmpty.png")
                        let TwoRedDiamondLined = #imageLiteral(resourceName: "TwoRedDiamondLined.png")
                                let TwoRedOvalFull = #imageLiteral(resourceName: "TwoRedOvalFull.png")
                                let TwoRedOvalEmpty = #imageLiteral(resourceName: "TwoRedOvalEmpty.png")
                                let TwoRedOvalLined = #imageLiteral(resourceName: "TwoRedOvalLined.png")
                               let TwoRedSFull = #imageLiteral(resourceName: "TwoRedSFull.png")
                                let TwoRedSEmpty = #imageLiteral(resourceName: "TwoRedSEmpty.png")
                                let TwoRedSLined = #imageLiteral(resourceName: "TwoRedSLined.png")
                        let TwoPurpleDiamondFull = #imageLiteral(resourceName: "TwoPurpleDiamondFull.png")
                        let TwoPurpleDiamondEmpty = #imageLiteral(resourceName: "TwoPurpleDiamondEmpty.png")
                        let TwoPurpleDiamondLined = #imageLiteral(resourceName: "TwoPurpleDiamondLined.png")
                                let TwoPurpleOvalFull = #imageLiteral(resourceName: "TwoPurpleOvalFull.png")
                                let TwoPurpleOvalEmpty = #imageLiteral(resourceName: "TwoPurpleOvalEmpty.png")
                                let TwoPurpleOvalLined = #imageLiteral(resourceName: "TwoPurpleOvalLined.png")
                               let TwoPurpleSFull = #imageLiteral(resourceName: "TwoPurpleSFull.png")
                                let TwoPurpleSEmpty = #imageLiteral(resourceName: "TwoPurpleSEmpty.png")
                                let TwoPurpleSLined = #imageLiteral(resourceName: "TwoPurpleSLined.png")
        
                let ThreeGreenDiamondFull = #imageLiteral(resourceName: "ThreeGreenDiamondFull.png")
                let ThreeGreenDiamondEmpty = #imageLiteral(resourceName: "ThreeGreenDiamondEmpty.png")
                let ThreeGreenDiamondLined = #imageLiteral(resourceName: "ThreeGreenDiamondLined.png")
                        let ThreeGreenOvalFull = #imageLiteral(resourceName: "ThreeGreenOvalFull.png")
                        let ThreeGreenOvalEmpty = #imageLiteral(resourceName: "ThreeGreenOvalEmpty.png")
                        let ThreeGreenOvalLined = #imageLiteral(resourceName: "ThreeGreenOvalLined.png")
                       let ThreeGreenSFull = #imageLiteral(resourceName: "ThreeGreenSFull.png")
                        let ThreeGreenSEmpty = #imageLiteral(resourceName: "ThreeGreenSEmpty.png")
                        let ThreeGreenSLined = #imageLiteral(resourceName: "ThreeGreenSLined.png")
                        let ThreeRedDiamondFull = #imageLiteral(resourceName: "ThreeRedDiamondFull.png")
                        let ThreeRedDiamondEmpty = #imageLiteral(resourceName: "ThreeRedDiamondEmpty.png")
                        let ThreeRedDiamondLined = #imageLiteral(resourceName: "ThreeRedDiamondLined.png")
                                let ThreeRedOvalFull = #imageLiteral(resourceName: "ThreeRedOvalFull.png")
                                let ThreeRedOvalEmpty = #imageLiteral(resourceName: "ThreeRedOvalEmpty.png")
                                let ThreeRedOvalLined = #imageLiteral(resourceName: "ThreeRedOvalLined.png")
                               let ThreeRedSFull = #imageLiteral(resourceName: "ThreeRedSFull.png")
                                let ThreeRedSEmpty = #imageLiteral(resourceName: "ThreeRedSEmpty.png")
                                let ThreeRedSLined = #imageLiteral(resourceName: "ThreeRedSLined.png")
                        let ThreePurpleDiamondFull = #imageLiteral(resourceName: "ThreePurpleDiamondFull.png")
                        let ThreePurpleDiamondEmpty = #imageLiteral(resourceName: "ThreePurpleDiamondEmpty.png")
                        let ThreePurpleDiamondLined = #imageLiteral(resourceName: "ThreePurpleDiamondLined.png")
                                let ThreePurpleOvalFull = #imageLiteral(resourceName: "ThreePurpleOvalFull.png")
                                let ThreePurpleOvalEmpty = #imageLiteral(resourceName: "ThreePurpleOvalEmpty.png")
                                let ThreePurpleOvalLined = #imageLiteral(resourceName: "ThreePurpleOvalLined.png")
                               let ThreePurpleSFull = #imageLiteral(resourceName: "ThreePurpleSFull.png")
                                let ThreePurpleSEmpty = #imageLiteral(resourceName: "ThreePurpleSEmpty.png")
                                let ThreePurpleSLined = #imageLiteral(resourceName: "ThreePurpleSLined.png")
        
        

        

        
        



        
        print("in setgame")
        print(username)
        cardButtons[0].setImage(OneGreenDiamondFull, for: .normal)
    }
}
