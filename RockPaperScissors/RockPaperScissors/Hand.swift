//
//  Hand.swift
//  RockPaperScissors
//
//  Created by 구 민영 on 3/21/24.
//

import Foundation

enum Hand: Equatable {
    case paper, rock, scissor
    
    var emoji: String {
        switch self {
        case .paper:
            return "🖐️"
        case .rock:
            return "✊"
        case .scissor:
            return "✌️"
        }
    }
}
