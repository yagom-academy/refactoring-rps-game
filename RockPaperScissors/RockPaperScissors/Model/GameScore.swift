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
    
    mutating func apply(matchResult: MatchResult) {
        switch matchResult {
        case .draw:
            draw += 1
        case .win:
            win += 1
        case .lose:
            lose += 1
        }
    }
}
