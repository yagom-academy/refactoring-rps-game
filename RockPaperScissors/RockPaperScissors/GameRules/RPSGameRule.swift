//
//  RPSGameRule.swift
//  RockPaperScissors
//
//  Created by Park Sungmin on 3/19/24.
//

import Foundation


final class RPSGameRule: GameRule {
    init(targetScore: Int) {
        score = GameScore(targetScore: targetScore)
    }
    
    var isMyTurn: Bool? = nil
    var score: GameScore
    var gameState: GameState = .playing
    
    func matchRule(myAction: Actions, opponentAction: Actions) -> MatchResult {
        switch (myAction, opponentAction) {
        case (.rock, .paper), (.sissor, .rock), (.paper, .sissor):
            return .lose
        
        case (.rock, .sissor), (.sissor, .paper), (.paper, .rock):
            return .win
            
        default:
            return .draw
      }
        
    }
    
    func playGame(myAction: Actions, opponentAction: Actions) {
        let matchResult = matchRule(myAction: myAction, opponentAction: opponentAction)
        
        score.applyMatchResult(matchResult: matchResult)
        
        
    }
}


