//
//  RockPaperScissorsTests.swift
//  RockPaperScissorsTests
//
//  Created by 강동영 on 2/6/24.
//

import XCTest
@testable import RockPaperScissors

final class RockPaperScissorsTests: XCTestCase {
    var sut: RPSGame!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = RPSGame(user: Player(hand: .rock),
                      computer: Player(hand: .paper))
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    // 양쪽이 낸 패의 승패 판결을 위한 기능을 TDD로 구현합니다
    //  해당 타입, 메서드를 구현해가며 지속적으로 리팩터링 합니다
    func test_양쪽이_낸_패의_승패_판결() {
        // given
        sut = RPSGame(user: Player(hand: .rock),
                      computer: Player(hand: .paper))
        
        // when
        let result = sut.determineWinner()
        
        // then
        XCTAssertEqual(result, .lose)
    }
    
    // 삼세판을 이기면 승리하는 기능을 TDD로 구현합니다
    func test_삼세판을_이기면_승리() {
        // given
        sut = RPSGame(user: Player(hand: .rock),
                      computer: Player(hand: .paper))
        
        // when
        sut.determineWinner3Game()
        
        // then
        let winner: Player = sut.isWinner().winner
        let loser: Player = sut.isWinner().loser
        
        XCTAssertEqual(winner.isWin, true)
        XCTAssertNotEqual(loser.isWin, true)
    }

    // 삼세판이 끝나고 승패가 갈리면 초기화 하는 기능을 TDD로 구현합니다
    func test_삼세판을_이기면_승패가_갈리면_초기화() {
        // given
        sut = RPSGame(user: Player(hand: .rock),
                      computer: Player(hand: .paper))
        
        sut.determineWinner3Game()
        
        // then
        sut.resetGame()
        
        XCTAssertEqual(sut.user.isReset, true)
        XCTAssertEqual(sut.computer.isReset, true)
    }
}





// 성능에 유리한 코드로 작성하도록 노력합니다
// 기획의 변경에 대해서 최대한 열린 코드로 작성해봅니다
