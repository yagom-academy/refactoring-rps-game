//
//  RockPaperScissors - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class GameViewController: UIViewController {

    override func loadView() {
        let user: Player = Player(name: "나", hand: .paper)
        let computer: Player = Player(name: "컴퓨터", hand: .paper)
        let game: Game = Game(user: user, computer: computer)
        view = GameView(game: game)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

