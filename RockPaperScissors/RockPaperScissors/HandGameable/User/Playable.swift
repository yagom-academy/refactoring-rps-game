//
//  User.swift
//  RockPaperScissors
//
//  Created by 홍승완 on 2024/03/20.
//

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

