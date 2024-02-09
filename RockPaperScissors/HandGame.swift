//
//  HandGame.swift
//  RockPaperScissors
//
//  Created by 김창규 on 2/6/24.
//

import Foundation

enum HandType {
    case left
    case right
}

protocol HandGame: AnyObject {
    var leftHand: HandStrategy { get }
    var rightHand: HandStrategy { get }
    var score: Score { get set }
    var myHand: HandType { get }
    
    func determineWinner(left: String?, right: String?)
    func resetScore()
}

extension HandGame {
    var leftHand: String { leftHand.randomHand }
    var rightHand: String { rightHand.randomHand }
    var leftName: String { leftHand.name }
    var rightName: String { rightHand.name }
    
    var winCount: Int { score.winCount }
    var loseCount: Int { score.loseCount }
    var drawCount: Int { score.drawCount }
    var totalScore: Int { score.totalScore }
    
    var gameResult: GameResult? { score.gameResult }
    var resultLabel: String? { gameResult?.label }
    
    var currentWinLose: String { score.currentWinlose }
    
    var gameFinished: Bool { totalScore >= score.limit }
    
    func resetScore() {
        score.resetScore()
    }
}

final class RPSGame: HandGame {
    var leftHand: HandStrategy
    var rightHand: HandStrategy
    var score: Score
    var myHand: HandType
    
    init(leftHand: HandStrategy, rightHand: HandStrategy, score: Score, myHand: HandType) {
        self.leftHand = leftHand
        self.rightHand = rightHand
        self.score = score
        self.myHand = myHand
    }
    
    func determineWinner(left: String?, right: String?) {
        let handComparison = myHand == .left ? (right, left) : (left, right)
        switch handComparison {
        case ("✌️","✊"),("🖐️","✌️"),("✊","🖐️"):
            score.upWinCount()
        case ("✊","✌️"),("✌️","🖐️"),("🖐️","✊"):
            score.upLoseCount()
        case ("✊","✊"),("✌️","✌️"),("🖐️","🖐️"):
            score.upDrawCount()
        default:
            return
        }
    }
}

final class MJPGame: HandGame {
    private(set) var leftHand: HandStrategy
    private(set) var rightHand: HandStrategy
    var score: Score
    private(set) var myHand: HandType
    private(set) var attacker: HandType?
    
    init(leftHand: HandStrategy,
         rightHand: HandStrategy,
         score: Score,
         myHand: HandType,
         attacker: HandType?) {
        self.leftHand = leftHand
        self.rightHand = rightHand
        self.score = score
        self.myHand = myHand
        self.attacker = attacker
    }
    
    func determineWinner(left: String?, right: String?) {
        let handComparison = myHand == .left ? (right, left) : (left, right)
        switch handComparison {
        case ("✌️","✊"),("🖐️","✌️"),("✊","🖐️"):
            score.upTotalCount()
            attacker = .right
        case ("✊","✌️"),("✌️","🖐️"),("🖐️","✊"):
            score.upTotalCount()
            attacker = .left
        case ("✊","✊"),("✌️","✌️"),("🖐️","🖐️"):
            score.upTotalCount()
            updateGameCount()
        default:
            return
        }
    }
    
    private func updateGameCount() {
        guard attacker != nil else { return }
        if attacker == myHand {
            score.upWinCount()
        } else {
            score.upLoseCount()
        }
        
        attacker = nil
    }
    
    func resetScore() {
        score.resetScore()
        attacker = nil
    }
}
