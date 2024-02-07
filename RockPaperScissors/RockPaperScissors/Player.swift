//
//  Player.swift
//  RockPaperScissors
//
//  Created by ChangMin on 2/6/24.
//

import Foundation

struct Player {
    private(set) var name: String
    private(set) var hand: Hand
    private(set) var winCount: Int = 0
    private(set) var loseCount: Int = 0
    private(set) var drawCount: Int = 0
    
    init(name: String, hand: Hand) {
        self.name = name
        self.hand = hand
    }
    
    var isWin: Bool {
        return winCount == 3
    }
    
    mutating func increaseWinCount() {
        self.winCount += 1
    }
    
    mutating func increaseDrawCount() {
        self.drawCount += 1
    }
    
    mutating func increaseLoseCount() {
        self.loseCount += 1
    }
    
    mutating func reset() {
        self.winCount = 0
        self.loseCount = 0
        self.drawCount = 0
    }
    
    mutating func makeRandomHand() {
        hand = Hand.allCases.randomElement()!
    }
}
