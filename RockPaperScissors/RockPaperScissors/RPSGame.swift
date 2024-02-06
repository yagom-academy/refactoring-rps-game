//
//  RPSGame.swift
//  RockPaperScissors
//
//  Created by 강동영 on 2/6/24.
//

import Foundation

struct RPSGame {
    enum GameResult {
        case win
        case draw
        case lose
    }
    
    let user: Player
    let computer: Player
    
    init(user: Player, computer: Player) {
        self.user = user
        self.computer = computer
    }
    
    func determineWinner() -> GameResult {
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
    
    func increseByGameResult(of result: GameResult) {
        switch result {
        case .win:
            user.increseWinCount()
        case .draw:
            break
        case .lose:
            computer.increseWinCount()
        }
    }
    
    func isWinner() -> (winner: Player, loser: Player) {
        let winner: Player = user.isWin ? user : computer
        let loser: Player = user.isWin ? computer : user
        
        return (winner, loser)
    }
    
    func determineWinner3Game() {
        repeat {
            // given
            user.makeRandomRPS()
            computer.makeRandomRPS()
            // when
            increseByGameResult(of: determineWinner())
        } while user.isWin && computer.isWin
    }
    
    func resetGame() {
        computer.clearWinCount()
        user.clearWinCount()
    }
}
