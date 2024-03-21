//
//  GameRule.swift
//  RockPaperScissors
//
//  Created by Park Sungmin on 3/20/24.
//

import Foundation

protocol GameRule {
    var gameStatus: GameStatus { get }
    var isMyTurn: Bool? { get }
    
    func matchRule(myAction: Actions, opponentAction: Actions) -> MatchResult
    
    func playGame(myAction: Actions, opponentAction: Actions) -> PlayResult?
    
    func resetGameStatue()
}
