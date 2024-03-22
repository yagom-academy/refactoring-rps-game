//
//  RPSCalculator.swift
//  RockPaperScissors
//
//  Created by Choi Oliver on 3/19/24.
//

import Foundation

enum Hand: String, CaseIterable {
    case paper = "🖐️"
    case rock = "✊"
    case scissor = "✌️"
    
    private var strategy: RPSStrategy {
        switch self {
        case .paper:
            RPSPaperStrategy()
        case .rock:
            RPSRockStrategy()
        case .scissor:
            RPSScissorStrategy()
        }
    }
    
    func singleSetPlay(opponentHand: Hand) -> SetResult {
        strategy.calculate(opponentHand: opponentHand)
    }
    
    static func randomHand() -> Hand? {
        Self.allCases.randomElement()
    }
}
