//
//  Game.swift
//  RockPaperScissors
//
//  Created by 홍승완 on 2024/03/19.
//

import Foundation

final class RockPaperScissorsGame: HandGameable {
    private let _user: Playable
    private let _computer: Playable

    var user: Playable {
        return _user
    }
    
    var computer: Playable {
        return _computer
    }
    
    init(user: User, 
         computer: User) {
        self._user = user
        self._computer = computer
    }
    
    func nextGame() {
        setGame()
        play()
    }
    
    func play() {
        switch judge() {
        case .userWin:
            user.winGame()
            computer.loseGame()
        case .userLose:
            user.loseGame()
            computer.winGame()
        case .draw:
            user.drawGame()
            computer.drawGame()
        }
    }
    
    func judge() -> Judge {
        guard let userHand = user.currentHand,
              let computerHand = computer.currentHand,
              let userIndex = Hand.allCases.firstIndex(of: userHand),
              let computerIndex = Hand.allCases.firstIndex(of: computerHand) else {
            fatalError()
        }
        
        let handAllCaseCount = Hand.allCases.count
        
        if userIndex == computerIndex {
            return .draw
        } else if (userIndex + 1) % handAllCaseCount == computerIndex {
            return .userWin
        } else {
            return .userLose
        }
    }

    func reset() {
        user.clear()
        computer.clear()
    }
    
    private func setGame() {
        user.changeHand()
        computer.changeHand()
    }
    
    enum Judge {
        case userWin, userLose, draw
    }
}
