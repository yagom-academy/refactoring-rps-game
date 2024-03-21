//
//  RockPaperScissors - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    
    override func loadView() {
        let gameRule = RPSGameRule(targetScore: 3)
        //        let gameRule = MJBGameRule(targetScore: 1)
        view = GameView(gameRule: gameRule, showAlert: showAlert)
    }
    
    private func showAlert(alertController: UIAlertController) {
        present(alertController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

