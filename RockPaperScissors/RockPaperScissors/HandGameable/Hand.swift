//
//  Hand.swift
//  RockPaperScissors
//
//  Created by 홍승완 on 2024/03/20.
//

enum Hand: CaseIterable {
    case paper, rock, scissor
    
    var description: String {
        switch self {
        case .paper: return "🖐️"
        case .rock: return "✊"
        case .scissor: return "✌️"
        }
    }
    
    var randomHand: Hand {
        return random()
    }
    
    private func random() -> Hand {
        guard let randomUserHand = Hand.allCases.randomElement() else {
            fatalError(">>> Error: random() in Hand")
        }
        return randomUserHand
    }
}
