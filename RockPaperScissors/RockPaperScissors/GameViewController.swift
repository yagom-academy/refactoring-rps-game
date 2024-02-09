//
//  RockPaperScissors - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    
    override func loadView() {
        view = GameView(
            mjpGame: MJPGame(
                leftHand: ComputerHand(
                    name: "컴퓨터"),
                rightHand: UserHand(
                    name: "나"),
                score: Score(
                    winCount: 0,
                    loseCount: 0,
                    drawCount: 0,
                    limit: 3,
                    totalGameCount: 0),
                myHand: .right,
                attacker: nil
            )
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

