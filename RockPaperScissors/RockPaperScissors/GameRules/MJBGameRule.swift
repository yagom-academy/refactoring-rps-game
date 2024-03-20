//
//  MJBGameRule.swift
//  RockPaperScissors
//
//  Created by Park Sungmin on 3/20/24.
//

import Foundation

class MJBGameRule : GameRule {
    var score: GameScore
    var gameState: GameState = .playing
    var isMyTurn: Bool?
    
    
    init(targetScore: Int) {
        self.score = GameScore(targetScore: targetScore)
        self.isMyTurn = true
    }
    
    func matchRule(myAction: Actions, opponentAction: Actions) -> MatchResult {
        
        return .draw
    }
    
    func playGame(myAction: Actions, opponentAction: Actions) {
        
    }
}
