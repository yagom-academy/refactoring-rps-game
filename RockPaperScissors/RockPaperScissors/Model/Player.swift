//
//  Player.swift
//  RockPaperScissors
//
//  Created by 구민영 on 3/22/24.
//

import Foundation

protocol Player {
    var score: Score { get set }
    var hand: Hand { get set }
    
    mutating func selectHand()
}

extension Player {
    mutating func selectHand() {
        self.hand = Hand.allCases.randomElement() ?? .paper
    }
}

struct User: Player {
    var score: Score
    var hand: Hand
}

struct Computer: Player {
    var score: Score
    var hand: Hand
}
