//
//  GameProcessor.swift
//  RockPaperScissors
//
//  Created by MacBook on 2024/03/22.
//

import Foundation

protocol GameProcessor {
    func play()
}

struct RPSGameProcessor: GameProcessor {
    private let gameCalculator: GameCalculator
    
    init(gameCalculator: GameCalculator) {
        self.gameCalculator = gameCalculator
    }
    
    func play() {
        
        switch gameCalculator.gameState {
        case .beforeStart, .playing:
            guard let myHand: Hand = Hand.randomHand(),
                  let opponentHand: Hand = Hand.randomHand()
            else {
                return
            }
            
            gameCalculator.play(myHand: myHand, opponentHand: opponentHand)
        case .finished:
            return
        }
    }
}
