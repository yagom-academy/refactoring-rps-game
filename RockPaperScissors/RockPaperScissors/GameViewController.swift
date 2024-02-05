//
//  RockPaperScissors - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    
    override func loadView() {
        view = GameView(
            leftHandGame: LeftHandGame(
                handStrategy: ComputerHand(
                    winCount: 0,
                    loseCount: 0,
                    drawCount: 0),
                gameResult: .ready),
            rightHandGame: RightHandGame(
                handStrategy: UserHand(
                    winCount: 0,
                    loseCount: 0,
                    drawCount: 0),
                gameResult: .ready))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

