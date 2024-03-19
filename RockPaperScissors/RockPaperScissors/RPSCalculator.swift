//
//  RPSCalculator.swift
//  RockPaperScissors
//
//  Created by Choi Oliver on 3/19/24.
//

import Foundation

private protocol RPSStrategy {
    func calculate(oppnentHand: Hand) -> RPSResult
}

private struct RockStrategy: RPSStrategy {
    func calculate(oppnentHand: Hand) -> RPSResult {
        return switch oppnentHand {
        case .paper:
                .lose
        case .rock:
                .draw
        case .scissor:
                .win
        }
    }
}

private struct ScissorStrategy: RPSStrategy {
    func calculate(oppnentHand: Hand) -> RPSResult {
        return switch oppnentHand {
        case .paper:
                .win
        case .rock:
                .lose
        case .scissor:
                .draw
        }
    }
}

private struct PaperStrategy: RPSStrategy {
    func calculate(oppnentHand: Hand) -> RPSResult {
        return switch oppnentHand {
        case .paper:
                .draw
        case .rock:
                .win
        case .scissor:
                .lose
        }
    }
}

enum Hand: String {
    case paper = "🖐️"
    case rock = "✊"
    case scissor = "✌️"
    
    private var strategy: RPSStrategy {
        switch self {
        case .paper:
            PaperStrategy()
        case .rock:
            RockStrategy()
        case .scissor:
            ScissorStrategy()
        }
    }
    
    func calculate(opponentHand: Hand) -> RPSResult {
        strategy.calculate(oppnentHand: opponentHand)
    }
}

enum RPSResult: String {
    case win
    case draw
    case lose
}

protocol RPSCalculator {
    func calculate(_ myHand: Hand, _ opponentHand: Hand) -> RPSResult
}

struct RPSCalculatorImpl: RPSCalculator {
    func calculate(_ myHand: Hand, _ opponentHand: Hand) -> RPSResult {
        myHand.calculate(opponentHand: opponentHand)
    }
}
