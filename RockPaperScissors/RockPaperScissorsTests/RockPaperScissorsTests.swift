//
//  RockPaperScissorsTests.swift
//  RockPaperScissorsTests
//
//  Created by 구 민영 on 3/21/24.
//

import XCTest
@testable import RockPaperScissors

final class RockPaperScissorsTests: XCTestCase {
    private var rps: RPSGame!
    
    override func setUp() {
        super.setUp()
        
        self.rps = RPSGame()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_userIsWinner() {
        let messageWhenTestFails = "사용자 승리 판별 실패"
        
        rps.user.hand = .paper
        rps.computer.hand = .rock
        XCTAssertEqual(rps.userVersusComputer(), .userWon, messageWhenTestFails)
        
        rps.user.hand = .rock
        rps.computer.hand = .scissor
        XCTAssertEqual(rps.userVersusComputer(), .userWon, messageWhenTestFails)
        
        rps.user.hand = .scissor
        rps.computer.hand = .paper
        XCTAssertEqual(rps.userVersusComputer(), .userWon, messageWhenTestFails)
    }
    
    func test_userIsLoser() {
        let messageWhenTestFails = "사용자 패배 판별 실패"
        
        rps.user.hand = .rock
        rps.computer.hand = .paper
        XCTAssertEqual(rps.userVersusComputer(), .userLost, messageWhenTestFails)
        
        rps.user.hand = .scissor
        rps.computer.hand = .rock
        XCTAssertEqual(rps.userVersusComputer(), .userLost, messageWhenTestFails)
        
        rps.user.hand = .paper
        rps.computer.hand = .scissor
        XCTAssertEqual(rps.userVersusComputer(), .userLost, messageWhenTestFails)
    }
    
    func test_userAndComputerAreDraw() {
        let messageWhenTestFails = "무승부 판별 실패"
        
        rps.user.hand = .rock
        rps.computer.hand = .rock
        XCTAssertEqual(rps.userVersusComputer(), .userDrew, messageWhenTestFails)
        
        rps.user.hand = .scissor
        rps.computer.hand = .scissor
        XCTAssertEqual(rps.userVersusComputer(), .userDrew, messageWhenTestFails)
        
        rps.user.hand = .paper
        rps.computer.hand = .paper
        XCTAssertEqual(rps.userVersusComputer(), .userDrew, messageWhenTestFails)
    }
    
    func test_whoIsFinalWinner() {
        let messageWhenTestFails = "최종 승리한 플레이어 판별 실패"
        rps.user.score.win = 3
        rps.computer.score.win = 2
        XCTAssertTrue(rps.finalWinner() is User, messageWhenTestFails)
        
        rps.user.score.win = 1
        rps.computer.score.win = 3
        XCTAssertTrue(rps.finalWinner() is Computer, messageWhenTestFails)
    }
    
    func test_finish() {
        let messageWhenTestFails = "게임 종료 판별 실패"
        rps.user.score.win = 2
        rps.computer.score.win = 2
        XCTAssertEqual(rps.isFinished(), false, messageWhenTestFails)
        
        rps.user.score.win = 3
        rps.computer.score.win = 0
        XCTAssertEqual(rps.isFinished(), true, messageWhenTestFails)
    }
    
    func test_reset() {
        let messageWhenTestFails = "리셋 실패"
        rps.user.score = Score(win: 3, draw: 2, lose: 1)
        rps.computer.score = Score(win: 1, draw: 2, lose: 3)
        rps.resetScore()
       
        let twoPlayersHaveTheSameScore = rps.user.score == rps.computer.score
        let isZeroScore = rps.user.score == Score()
        
        XCTAssertTrue(twoPlayersHaveTheSameScore && isZeroScore, messageWhenTestFails)
    }
}
