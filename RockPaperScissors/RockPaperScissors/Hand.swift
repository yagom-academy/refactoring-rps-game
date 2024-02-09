//
//  Hand.swift
//  RockPaperScissors
//
//  Created by 강동영 on 2/9/24.
//

import Foundation

enum Hand: CaseIterable {
    case rock
    case paper
    case scissor
    
    var imoji: String {
        switch self {
        case .rock: "✊"
        case .paper: "🖐️"
        case .scissor: "✌️"
        }
    }
}
