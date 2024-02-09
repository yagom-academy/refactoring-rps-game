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
    
    var gameFinished: Bool { score.totalScore >= score.limit }
    
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
}
