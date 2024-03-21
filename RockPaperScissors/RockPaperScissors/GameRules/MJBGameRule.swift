//
//  MJBGameRule.swift
//  RockPaperScissors
//
//  Created by Park Sungmin on 3/20/24.
//

import Foundation

class MJBGameRule : GameRule {
    var gameStatus: GameStatus
    var isMyTurn: Bool?
    
    
    init(targetScore: Int) {
        self.gameStatus = GameStatus(targetScore: targetScore)
        self.isMyTurn = true
    }
    
    func matchRule(myAction: Actions, opponentAction: Actions) -> MatchResult {
        
        return .draw
    }
    
    func playGame(myAction: Actions, opponentAction: Actions) {
        
    }
}
