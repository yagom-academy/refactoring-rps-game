//
//  RPSGameRule.swift
//  RockPaperScissors
//
//  Created by Park Sungmin on 3/19/24.
//

import Foundation

class RPSGameRule {
    func matchRPS(myAction: Actions, opponentAction: Actions) -> MatchResult{
        switch myAction {
        case .rock:
            switch opponentAction {
            case .rock:
                return .draw
            case .paper:
                return .lose
            case .sissor:
                return .win
            }
        case .paper:
            switch opponentAction {
            case .rock:
                return .win
            case .paper:
                return .draw
            case .sissor:
                return .lose
            }
        case .sissor:
            switch opponentAction {
            case .rock:
                return .lose
            case .paper:
                return .win
            case .sissor:
                return .draw
            }
        }
    }
}
