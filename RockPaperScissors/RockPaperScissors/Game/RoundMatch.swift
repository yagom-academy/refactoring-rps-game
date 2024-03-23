//
//  RoundMatch.swift
//  RockPaperScissors
//
//  Created by 구 민영 on 3/22/24.
//

import Foundation

protocol RoundMatchStrategy {
    func applyScore(_ userScore: Score, _ computerScore: Score) -> (user: Score, computer: Score)
}

struct UserWon: RoundMatchStrategy {
    func applyScore(_ userScore: Score, _ computerScore: Score) -> (user: Score, computer: Score) {
        userScore.win += 1
        computerScore.lose += 1
        
        return (userScore, computerScore)
    }
}

struct UserDrew: RoundMatchStrategy {
    func applyScore(_ userScore: Score, _ computerScore: Score) -> (user: Score, computer: Score) {
        userScore.draw += 1
        computerScore.draw += 1
        
        return (userScore, computerScore)
    }
}

struct UserLost: RoundMatchStrategy {
    func applyScore(_ userScore: Score, _ computerScore: Score) -> (user: Score, computer: Score) {
        userScore.lose += 1
        computerScore.win += 1
        
        return (userScore, computerScore)
    }
}

enum RoundMatchResult: Equatable {
    case userWon, userDrew, userLost
    
    var strategy: RoundMatchStrategy {
        switch self {
        case .userWon:
            return UserWon()
        case .userDrew:
            return UserDrew()
        case .userLost:
            return UserLost()
        }
    }
}
