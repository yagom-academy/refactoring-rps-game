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
    
    var label: String {
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
