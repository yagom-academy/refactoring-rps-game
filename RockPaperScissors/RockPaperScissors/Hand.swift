//
//  Hand.swift
//  RockPaperScissors
//
//  Created by 홍은표 on 3/19/24.
//

import Foundation

protocol HandStrategy {
  func nextHand() -> Hand
}

struct RandomHandStrategy: HandStrategy {
  func nextHand() -> Hand {
    guard let hand = Hand.allCases.randomElement() else {
      fatalError("error - hand randomElement()")
    }
    return hand
  }
}

enum Hand: CaseIterable {
  case paper
  case rock
  case scissor
  
  var symbol: String {
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
