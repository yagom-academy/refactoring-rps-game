//
//  File.swift
//  RockPaperScissors
//
//  Created by Park Sungmin on 3/20/24.
//

import Foundation

struct GameStatus {
    var score: GameScore
    var gameResult: GameResult
    
    init(targetScore: Int) {
        self.score = GameScore(targetScore: targetScore)
        self.gameResult = GameResult.playing
    }
    
    mutating func applyMatchResult(matchResult: MatchResult) {
        score.apply(matchResult: matchResult)
        gameResult.update(with: score)
    }
}
