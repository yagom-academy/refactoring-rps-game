//
//  Game.swift
//  RockPaperScissors
//
//  Created by 홍승완 on 2024/03/19.
//

import Foundation

protocol GameScore {
    var winCount: Int { get }
    var loseCount: Int { get }
    var drawCount: Int { get }
    
    mutating func win()
    mutating func lose()
    mutating func draw()
}

struct Score: GameScore {
    private var _winCount: Int
    private var _loseCount: Int
    private var _drawCount: Int
    
    var winCount: Int {
        return _winCount
    }
    
    var loseCount: Int {
        return _loseCount
    }
    
    var drawCount: Int {
        return _drawCount
    }
    
    init(_winCount: Int = 0,
         _loseCount: Int = 0,
         _drawCount: Int = 0) {
        self._winCount = _winCount
        self._loseCount = _loseCount
        self._drawCount = _drawCount
    }
    
    mutating func win() {
        self._winCount += 1
    }
    mutating func lose() {
        self._loseCount += 1
    }
    mutating func draw() {
        self._drawCount += 1
    }
}

enum Hand: CaseIterable {
    case paper, rock, scissor
    
    var description: String {
        switch self {
        case .paper: return "🖐️"
        case .rock: return "✊"
        case .scissor: return "✌️"
        }
    }
    
    var randomHand: Hand {
        return random()
    }
    
    private func random() -> Hand {
        guard let randomUserHand = Hand.allCases.randomElement() else {
            fatalError(">>> Error: random() in Hand")
        }
        return randomUserHand
    }
}

protocol Playable {
    var score: GameScore { get }
    var currentHand: Hand? { get }
    
    func changeHand()
    func winGame()
    func loseGame()
    func drawGame()
    func clear()
}


final class User: Playable {
    private var hand: Hand?
    var score: GameScore
    
    var currentHand: Hand? {
        return hand
    }
    
    init(score: GameScore = Score(),
         hand: Hand? = nil) {
        self.score = score
        self.hand = hand
    }
    
    func winGame() {
        score.win()
    }
    func loseGame() {
        score.lose()
    }
    func drawGame() {
        score.draw()
    }
    
    func changeHand() {
        hand = hand?.randomHand
    }
    
    func clear() {
        score = Score()
        hand = nil
    }
}

final class Game {
    let user: Playable
    let computer: Playable
    
    init(user: User, 
         computer: User) {
        self.user = user
        self.computer = computer
    }
    
    func nextGame() {
        setGame()
        play()
    }
    
    func play() {
        guard let userHand = user.currentHand,
              let computerHand = computer.currentHand else {
            return
        }
        
        switch judge(userHand, computerHand) {
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

    func judge(_ userHand: Hand, _ computerHand: Hand) -> Judge {
        guard let userIndex = Hand.allCases.firstIndex(of: userHand),
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
