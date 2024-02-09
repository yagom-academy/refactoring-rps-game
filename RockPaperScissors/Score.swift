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
    private(set) var limit: Int
    private(set) var totalGameCount : Int
    var counts: [Int] { [winCount, loseCount, drawCount] }
    var totalScore: Int { counts.reduce(0,+) }
    var currentWinlose: String { "\(winCount)승 \(loseCount)패 \(drawCount)무" }
    
    var gameResult: GameResult? {
        if totalGameCount == 0 {
            return .ready
        } else if totalScore < limit {
            return .playing
        } else if winCount == loseCount {
            return .draw
        } else if winCount > loseCount {
            return .win
        } else if winCount < loseCount {
            return .lose
        } else {
            return .none
        }
    }
}

extension Score {
    mutating func upWinCount() {
        self.winCount += 1
        upTotalCount()
    }
    
    mutating func upLoseCount() {
        self.loseCount += 1
        upTotalCount()
    }
    
    mutating func upDrawCount() {
        self.drawCount += 1
        upTotalCount()
    }
    
    mutating func upTotalCount() {
        self.totalGameCount += 1
    }
    
    mutating func resetScore() {
        self.winCount = 0
        self.loseCount = 0
        self.drawCount = 0
        self.totalGameCount = 0
    }
}
