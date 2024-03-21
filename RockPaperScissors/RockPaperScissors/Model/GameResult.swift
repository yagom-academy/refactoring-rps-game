//
//  GameState.swift
//  RockPaperScissors
//
//  Created by Park Sungmin on 3/19/24.
//

import Foundation

enum GameResult: Int {
    case draw = 0, win, lose, playing
    
    mutating func update(with gameScore: GameScore) {
        if gameScore.win >= gameScore.targetScore {
            self = .win
            return
        }
        
        if gameScore.lose >= gameScore.targetScore {
            self = .lose
            return
        }
        
        self = .playing
    }
}
