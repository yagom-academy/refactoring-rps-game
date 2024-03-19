//
//  RPSGameRule.swift
//  RockPaperScissors
//
//  Created by Park Sungmin on 3/19/24.
//

import Foundation



class RPSGameRule {
    func matchRPS(myAction: Actions, opponentAction: Actions) -> MatchResult {
        let result = (myAction.rawValue - opponentAction.rawValue + 3) % 3
        return MatchResult(rawValue: result)!
    }
    
    func matchTripleRPS() -> MatchResult {
        return .win
    }
    
    func checkWinLossState(score: GameScore) -> MatchResult {
        return score.matchResult
    }
}
