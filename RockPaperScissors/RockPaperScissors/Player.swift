//
//  Player.swift
//  RockPaperScissors
//
//  Created by 강동영 on 2/6/24.
//

import Foundation

final class Player {
    private(set) var hand: Hand
    private var winCount: Int = 0
    
    init(hand: Hand) {
        self.hand = hand
    }
    
    var isWin: Bool {
        return winCount < 3
    }
    
    var isReset: Bool {
        return winCount == 0
    }
    
    func increaseWinCount() {
        winCount += 1
    }
    
    func resetWinCount() {
        winCount = 0
    }
    
    func makeRandomRPS() {
        hand = Hand.allCases.randomElement()!
    }
}
