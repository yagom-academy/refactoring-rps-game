//
//  Score.swift
//  RockPaperScissors
//
//  Created by 홍승완 on 2024/03/20.
//

protocol GameScore {
    var winCount: Int { get }
    var loseCount: Int { get }
    var drawCount: Int { get }
    
    mutating func win()
    mutating func lose()
    mutating func draw()
}

struct Score: GameScore {
    private var _winCount: Int
    private var _loseCount: Int
    private var _drawCount: Int
    
    var winCount: Int {
        return _winCount
    }
    
    var loseCount: Int {
        return _loseCount
    }
    
    var drawCount: Int {
        return _drawCount
    }
    
    init(winCount: Int = 0,
         loseCount: Int = 0,
         drawCount: Int = 0) {
        self._winCount = winCount
        self._loseCount = loseCount
        self._drawCount = drawCount
    }
    
    mutating func win() {
        self._winCount += 1
    }
    mutating func lose() {
        self._loseCount += 1
    }
    mutating func draw() {
        self._drawCount += 1
    }
}
