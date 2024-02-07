//
//  Game.swift
//  RockPaperScissors
//
//  Created by ChangMin on 2/7/24.
//

import Foundation

struct Game {
    var user: Player
    var computer: Player
    
    init(user: Player, computer: Player) {
        self.user = user
        self.computer = computer
    }
    
    mutating func startGame() {
        user.makeRandomHand()
        computer.makeRandomHand()
    }
    
    mutating func decideWinner() {
        let result: (Hand, Hand) = (user.hand, computer.hand)
        switch result {
        case (.paper, .paper), (.rock, .rock), (.scissor , .scissor):
            user.increaseDrawCount()
            computer.increaseDrawCount()
            
        case (.paper, .rock), (.rock, .scissor), (.scissor , .paper):
            user.increaseWinCount()
            computer.increaseLoseCount()
            
        case (.paper, .scissor), (.rock, .paper), (.scissor , .rock):
            user.increaseLoseCount()
            computer.increaseWinCount()
        }
    }
    
    func winnerName() -> String? {
        if user.isWin {
            return user.name
        }
            
        if computer.isWin {
            return computer.name
        }
        
        return nil
    }
    
    mutating func reset() {
        user.reset()
        computer.reset()
    }
}
