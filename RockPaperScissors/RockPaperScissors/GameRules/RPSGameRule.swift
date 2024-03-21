//
//  RPSGameRule.swift
//  RockPaperScissors
//
//  Created by Park Sungmin on 3/19/24.
//

import Foundation


final class RPSGameRule: GameRule {
    init(targetScore: Int) {
        gameStatus = GameStatus(targetScore: targetScore)
    }
    
    var isMyTurn: Bool? = nil
    var gameStatus: GameStatus
    
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
    
    func playGame(myAction: Actions, opponentAction: Actions) -> GameResult? {
        let matchResult = matchRule(myAction: myAction, opponentAction: opponentAction)
        gameStatus.applyMatchResult(matchResult: matchResult)
        
        switch matchResult {
        case .draw:
            return .draw
        case .win:
            return .win
        case .lose:
            return .lose
        }
    }
    
    func resetGameStatue() {
        gameStatus.reset()
    }
}


