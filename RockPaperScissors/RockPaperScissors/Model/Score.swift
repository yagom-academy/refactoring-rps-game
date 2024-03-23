//
//  Score.swift
//  RockPaperScissors
//
//  Created by 구민영 on 3/22/24.
//

import Foundation

final class Score: Equatable {
    static func == (lhs: Score, rhs: Score) -> Bool {
        lhs.win == rhs.win && lhs.draw == rhs.draw && lhs.lose == rhs.lose
    }
    
    var win: Int
    var draw: Int
    var lose: Int
    
    func reset() {
        self.win = 0
        self.draw = 0
        self.lose = 0
    }
    
    convenience init() {
        self.init(win: 0, draw: 0, lose: 0)
    }
    
    init(win: Int, draw: Int, lose: Int) {
        self.win = win
        self.draw = draw
        self.lose = lose
    }
}
