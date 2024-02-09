//
//  RPSGame.swift
//  RockPaperScissors
//
//  Created by 강동영 on 2/6/24.
//

import Foundation

struct RPSGame: RPSAble {
    let user: Player
    let computer: Player
    
    init(user: Player, computer: Player) {
        self.user = user
        self.computer = computer
    }
    
    func readyToGame() {
        user.makeRandomRPS()
        computer.makeRandomRPS()
    }
    
    func playGame() -> GameResult {
        if user.hand == computer.hand {
            return .draw
        } else if (user.hand == .rock && computer.hand == .scissor) ||
                    (user.hand == .paper && computer.hand == .rock) ||
                    (user.hand == .scissor && computer.hand == .paper) {
            return .win
        } else {
            return .lose
        }
    }
    
    func checkResult() {
        updateWinCount(by: playGame())
    }
    
    func updateWinCount(by result: GameResult) {
        switch result {
        case .win:
            user.increaseWinCount()
        case .draw:
            break
        case .lose:
            computer.increaseWinCount()
        }
    }
    
    func getGameResult() -> (winner: Player, loser: Player) {
        let winner: Player = user.isWinner ? user : computer
        let loser: Player = user.isWinner ? computer : user
        
        return (winner, loser)
    }
    
    func playThreeGames() {
        repeat {
            // given
            user.makeRandomRPS()
            computer.makeRandomRPS()
            // when
            updateWinCount(by: playGame())
        } while user.isWinner && computer.isWinner
    }
    
    func resetGame() {
        computer.resetWinCount()
        user.resetWinCount()
    }
}
