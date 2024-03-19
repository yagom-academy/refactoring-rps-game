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

struct Score {
    var winCount: Int
    var loseCount: Int
    var drawCount: Int
    
    init(winCount: Int = 0,
         loseCount: Int = 0,
         drawCount: Int = 0) {
        self.winCount = winCount
        self.loseCount = loseCount
        self.drawCount = drawCount
    }
    
    mutating func win() {
        self.winCount += 1
    }
    mutating func lose() {
        self.loseCount += 1
    }
    mutating func draw() {
        self.drawCount += 1
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
}

final class User {
    var score: Score
    var hand: Hand
    
    init(score: Score = Score(),
         hand: Hand) {
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
        let randomHand = Hand.allCases[Int.random(in: 0..<Hand.allCases.count)]
        hand = randomHand
    }
    
    func reset() {
        let randomHand = Hand.allCases[Int.random(in: 0..<Hand.allCases.count)]
        score = .init()
        hand = randomHand
    }
}

final class Game {
    let user: User
    let computer: User
    
    init(user: User, computer: User) {
        self.user = user
        self.computer = computer
    }
    
    func nextGame() {
        user.changeHand()
        computer.changeHand()
        game()
    }
    
    func game() {
        if ((user.hand == .paper &&
           computer.hand == .rock) ||
            (user.hand == .rock &&
           computer.hand == .scissor) ||
            (user.hand == .scissor &&
           computer.hand == .paper)) {
            user.winGame()
            computer.loseGame()
        }
        else if ((user.hand == .paper &&
                computer.hand == .scissor) ||
                 (user.hand == .rock &&
                computer.hand == .paper) ||
                 (user.hand == .scissor &&
                computer.hand == .rock)) {
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
