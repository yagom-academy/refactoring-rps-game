//
//  GameStrategy.swift
//  RockPaperScissors
//
//  Created by MacBook on 2024/03/22.
//

import Foundation

protocol RPSStrategy {
    func calculate(opponentHand: Hand) -> SetResult
}

struct RPSRockStrategy: RPSStrategy {
    func calculate(opponentHand: Hand) -> SetResult {
        return switch opponentHand {
        case .paper:
                .lose
        case .rock:
                .draw
        case .scissor:
                .win
        }
    }
}

struct RPSScissorStrategy: RPSStrategy {
    func calculate(opponentHand: Hand) -> SetResult {
        return switch opponentHand {
        case .paper:
                .win
        case .rock:
                .lose
        case .scissor:
                .draw
        }
    }
}

struct RPSPaperStrategy: RPSStrategy {
    func calculate(opponentHand: Hand) -> SetResult {
        return switch opponentHand {
        case .paper:
                .draw
        case .rock:
                .win
        case .scissor:
                .lose
        }
    }
}
