//
//  RPSGameRule.swift
//  RockPaperScissors
//
//  Created by Park Sungmin on 3/19/24.
//

import Foundation

protocol GameRule {
    var score: GameScore { get }
    
    func match(myAction: Actions, opponentAction: Actions) -> MatchResult
}

class RPSGameRule: GameRule {
    init(targetScore: Int) {
        score = GameScore(targetScore: targetScore)
    }
    
    var score: GameScore
    
    func match(myAction: Actions, opponentAction: Actions) -> MatchResult {
        let result = (myAction.rawValue - opponentAction.rawValue + 3) % 3
        return MatchResult(rawValue: result)!
    }
}
