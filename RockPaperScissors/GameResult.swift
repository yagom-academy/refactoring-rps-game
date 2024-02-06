//
//  GameResult.swift
//  RockPaperScissors
//
//  Created by 김창규 on 2/6/24.
//

import Foundation

enum GameResult: Int {
    case win = 0
    case lose
    case draw
    case playing
    case ready
    
    var result: String {
        switch self {
        case .win:
            return "승리"
        case .lose:
            return "패배"
        case .draw:
            return "무승부"
        case .playing:
            return "게임중"
        case .ready:
            return "준비"
        }
    }
}

enum GameState {
    static let GAME_WIN = 0
    static let GAME_LOSE = 1
    static let GAME_DRAW = 2
    static let GAME_PLAYING = 3
    static let GAME_READY = 4
}
