//
//  RockPaperScissors - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class GameViewController: UIViewController {

    
    override func loadView() {
        let randomUserHand = Hand.allCases[Int.random(in: 0..<Hand.allCases.count)]
        let randomComputerHand = Hand.allCases[Int.random(in: 0..<Hand.allCases.count)]
        view = GameView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

