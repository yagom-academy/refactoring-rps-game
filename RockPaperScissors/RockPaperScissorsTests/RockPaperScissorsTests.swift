//
//  RockPaperScissorsTests.swift
//  RockPaperScissorsTests
//
//  Created by 구 민영 on 3/21/24.
//

import XCTest
@testable import RockPaperScissors

final class RockPaperScissorsTests: XCTestCase {
    func test_playerIsWinner() {
        var rps = RPSGame()
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
    
    func test_playerIsLoser() {
        var rps = RPSGame()
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
    
    func test_playerAndComputerAreDraw() {
        var rps = RPSGame()
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
    
    // todo
    // 3번 이긴 플레이어가 나왔을 때 끝나는지
    // 초기화가 되는지
    // 3번 이겼을 때 초기화 하는지
}
