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
        let result = (myAction.rawValue - opponentAction.rawValue + 3) % 3
        return MatchResult(rawValue: result)!
    }
    
    func playGame(myAction: Actions, opponentAction: Actions) {
        let matchResult = matchRule(myAction: myAction, opponentAction: opponentAction)
        
        switch matchResult {
        case .draw:
            drawSingleGame()
        case .win:
            winSingleGame()
        case .lose:
            loseSingleGame()
        }
        
        if score.matchResult != .draw {
            gameState = .done
        }
    }
    
    private func winSingleGame() {
        score.win += 1
    }
    
    private func loseSingleGame() {
        score.lose += 1
    }
    
    private func drawSingleGame() {
        score.draw += 1
    }
}


