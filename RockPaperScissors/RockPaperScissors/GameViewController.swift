//
//  RockPaperScissors - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class GameViewController: UIViewController {

//    var genealogy: Genealogy

    override func loadView() {
        view = GameView()
    }
    
//    init(genealogy: Genealogy){
//        self.genealogy = genealogy
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var genealogy: Genealogy = Genealogy()
        let rps: RPS = RPS(genealogy: genealogy)
        
        guard try! rps.rpsModify(of: ["🖐️", "✊"])
       
        else {
            print("패배")
            return
        }
                                 
        print("승리")

    }


}

