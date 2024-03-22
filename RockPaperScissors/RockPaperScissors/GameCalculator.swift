//
//  GameCalculator.swift
//  RockPaperScissors
//
//  Created by MacBook on 2024/03/22.
//

import Foundation

enum GameState: Equatable {
    case beforeStart
    case playing
    case finished(isWin: Bool)
}

enum SetResult: String {
    case win
    case draw
    case lose
}

protocol GameCalculator {
    var gameState: GameState { get }
    
    func play(myHand: Hand, opponentHand: Hand)
    func reset()
}

final class RPSGameCalculator: GameCalculator {
    private var winCount: Int
    private var gameCount: Int
    private let maxGameCount: Int
    private let winCondition: Int
    private(set) var gameState: GameState
    
    init(maxGameCount: Int, winCondition: Int) {
        self.maxGameCount = maxGameCount
        self.winCondition = winCondition
        self.winCount = 0
        self.gameCount = 0
        self.gameState = .beforeStart
    }
    
    func play(myHand: Hand, opponentHand: Hand) {
        gameState = .playing
        gameCount += 1
        let setResult: SetResult = myHand.singleSetPlay(opponentHand: opponentHand)
        
        if setResult == .win {
            winCount += 1
        }
        
        if gameCount == maxGameCount {
            let isWin: Bool = winCount >= winCondition
            gameState = .finished(isWin: isWin)
        }
    }
    
    func reset() {
        winCount = 0
        gameCount = 0
        gameState = .beforeStart
    }
}
