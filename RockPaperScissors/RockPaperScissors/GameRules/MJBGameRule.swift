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
        guard let isMyTurn else { return nil }
        
        let matchResult = matchRule(myAction: myAction, opponentAction: opponentAction)
        
        switch matchResult {
        case .draw:
            if isMyTurn {
                gameStatus.applyMatchResult(matchResult: .win)
                return .win
            } else {
                gameStatus.applyMatchResult(matchResult: .lose)
                return .lose
            }
            
        case .win:
            self.isMyTurn = true
            
        case .lose:
            self.isMyTurn = false
        }
        
        return .playing
    }
    
    func resetGameStatue() {
        gameStatus.reset()
    }
}
