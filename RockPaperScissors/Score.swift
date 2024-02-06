//
//  Score.swift
//  RockPaperScissors
//
//  Created by 김창규 on 2/7/24.
//

import Foundation

struct Score {
    private(set) var winCount: Int
    private(set) var loseCount: Int
    private(set) var drawCount: Int
    var limit: Int
    var counts: [Int] { [winCount, loseCount, drawCount] }
    var totalScore: Int { counts.reduce(0,+) }
    
    var correuntWinlose: String { "\(winCount)승 \(loseCount)패 \(drawCount)무" }
    
    var gameResult: GameResult? {
        var index = 0
        
        if totalScore == 0 {
            index = GameState.GAME_READY
        } else if totalScore < limit {
            index = GameState.GAME_PLAYING
        } else if winCount == loseCount {
            index = GameState.GAME_DRAW
        } else if winCount > loseCount {
            index = GameState.GAME_WIN
        } else if winCount < loseCount {
            index = GameState.GAME_LOSE
        }
        
        return GameResult(rawValue: index)
    }
}

extension Score {
    mutating func upWinCount() {
        self.winCount += 1
    }
    
    mutating func upLoseCount() {
        self.loseCount += 1
    }
    
    mutating func upDrawCount() {
        self.drawCount += 1
    }
    
    mutating func resetScore() {
        self.winCount = 0
        self.loseCount = 0
        self.drawCount = 0
    }
}
