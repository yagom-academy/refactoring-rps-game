//
//  Hand.swift
//  RockPaperScissors
//
//  Created by ChangMin on 2/7/24.
//

import Foundation

enum Hand: CaseIterable {
    case paper
    case rock
    case scissor
    
    var value: String {
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
