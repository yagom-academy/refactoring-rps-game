//
//  Game.swift
//  RockPaperScissors
//
//  Created by 홍승완 on 2024/03/19.
//

import Foundation

///
/// 사용자와 컴퓨터의 가위 바위 보 게임입니다
/// 사용자가 패를 선택하면 컴퓨터의 패는 임의의 패로 지정됩니다
/// 현재 승/무/패 기록은 화면 중앙에 표시합니다
/// 승/무/패 기록은 사용자 기준 승/무/패를 나타냅니다
/// 삼세판 선승제로, 세 판을 먼저 이기는 쪽이 승리합니다
/// 어느 한 쪽이 최종 승리하면 얼럿을 통해 승자를 표시하고 게임을 초기화합니다
///

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
    var hand: Hand? { get }
    
    func changeHand()
    func winGame()
    func loseGame()
    func drawGame()
    func reset()
}


final class User: Playable {
    var score: GameScore
    var hand: Hand?
    
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
    
    func reset() {
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
        user.changeHand()
        computer.changeHand()
        game()
    }
    
    func game() {
        if userWin() {
            user.winGame()
            computer.loseGame()
        }
        else if userLose() {
            computer.winGame()
            user.loseGame()
        } else {
            computer.drawGame()
            user.drawGame()
        }
    }
    
    func userWin() -> Bool {
        return ((user.hand == .paper &&
                 computer.hand == .rock) ||
                  (user.hand == .rock &&
                 computer.hand == .scissor) ||
                  (user.hand == .scissor &&
                 computer.hand == .paper))
    }
    
    func userLose() -> Bool {
        return ((user.hand == .paper &&
                 computer.hand == .scissor) ||
                  (user.hand == .rock &&
                 computer.hand == .paper) ||
                  (user.hand == .scissor &&
                 computer.hand == .rock))
    }
    
    func draw() -> Bool {
        return !(userWin()||userLose())
    }
    
    func resetGame() {
        user.reset()
        computer.reset()
    }
}
