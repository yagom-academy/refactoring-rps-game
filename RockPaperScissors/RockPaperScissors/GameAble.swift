//
//  GameAble.swift
//  RockPaperScissors
//
//  Created by 강동영 on 2/9/24.
//

import Foundation

protocol GameAble {
    func readyToGame()
    func playGame() -> GameResult
    func checkResult()
    func resetGame()
}

protocol RPSAble: GameAble {
    var user: Player { get }
    var computer: Player { get }
    
    func updateWinCount(by result: GameResult)
    func getGameResult() -> (winner: Player, loser: Player)
}

enum GameResult {
    case win
    case draw
    case lose
}
