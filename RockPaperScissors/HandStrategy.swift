//
//  HandStrategy.swift
//  RockPaperScissors
//
//  Created by 김창규 on 2/6/24.
//

import Foundation

protocol HandStrategy {
    var name: String { get }
}

extension HandStrategy {
    var randomHand: String {
        return ["✊","✌️","🖐️"].randomElement() ?? ""
    }
}

struct ComputerHand: HandStrategy {
    private(set) var name: String
}

struct UserHand: HandStrategy {
    private(set) var name: String
}
