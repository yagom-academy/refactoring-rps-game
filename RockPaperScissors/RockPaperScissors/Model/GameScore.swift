//
//  GameScore.swift
//  RockPaperScissors
//
//  Created by Park Sungmin on 3/19/24.
//

import Foundation

struct GameScore {
    var targetScore: Int
    
    var win: Int = 0
    var draw: Int = 0
    var lose: Int = 0
    
    var matchResult: MatchResult {
        get {
            if win == targetScore {
                return MatchResult.win
            }
            else if lose == targetScore {
                return MatchResult.lose
            }
            else {
                return MatchResult.draw
            }
        }
    }
}
