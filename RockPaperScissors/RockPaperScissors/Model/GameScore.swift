//
//  GameScore.swift
//  RockPaperScissors
//
//  Created by Park Sungmin on 3/19/24.
//

import Foundation

struct GameScore {
    var win = 0
    var draw = 0
    var lose = 0
    
    var matchResult: MatchResult {
        get {
            if win == 3 {
                return MatchResult.win
            }
            
            else if lose == 3 {
                return MatchResult.lose
            }
            
            else {
                return MatchResult.draw
            }
        }
    }
}
