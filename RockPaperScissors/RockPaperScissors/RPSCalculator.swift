//
//  RPSCalculator.swift
//  RockPaperScissors
//
//  Created by Choi Oliver on 3/19/24.
//

import Foundation

protocol RPSCalculator {
    func calculate(_ myHand: Hand, _ opponentHand: Hand) -> RPSResult
}

struct RPSCalculatorImpl: RPSCalculator {
    func calculate(_ myHand: Hand, _ opponentHand: Hand) -> RPSResult {
        .win
    }
}
