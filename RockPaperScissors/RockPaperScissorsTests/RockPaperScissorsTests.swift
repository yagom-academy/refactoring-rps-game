//
//  RockPaperScissorsTests.swift
//  RockPaperScissorsTests
//
//  Created by ChangMin on 2/5/24.
//

import XCTest
@testable import RockPaperScissors

final class RockPaperScissorsTests: XCTestCase {
    var sut: Game!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let user: Player = .init(name: "나", hand: .paper)
        let computer: Player = .init(name: "컴퓨터", hand: .paper)
        sut = Game(user: user, computer: computer)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }

    func test_유저가_3승했을경우_isWin이_true인가() {
        // given
        sut.user.increaseWinCount()
        sut.user.increaseWinCount()
        sut.user.increaseWinCount()
        
        // when
        let result = sut.user.isWin
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_유저가_3승해서_승리한경우_유저이름과_winnerName이_동일한가() {
        // given
        sut.user.increaseWinCount()
        sut.user.increaseWinCount()
        sut.user.increaseWinCount()
        
        // when
        let winnerName = sut.winnerName()
        
        // then
        XCTAssertEqual(sut.user.name, winnerName)
    }
    
    func test_reset버튼을_누르면_상태가_초기화되는가() {
        // given
        sut.reset()
        
        // when
        let userWinCount = sut.user.winCount
        let userDrawCount = sut.user.drawCount
        let userLoseCount = sut.user.loseCount
        
        let computerWinCount = sut.computer.winCount
        let computerDrawCount = sut.computer.drawCount
        let computerLoseCount = sut.computer.loseCount
        
        // then
        XCTAssertEqual(userWinCount, 0)
        XCTAssertEqual(userDrawCount, 0)
        XCTAssertEqual(userLoseCount, 0)
        
        XCTAssertEqual(computerWinCount, 0)
        XCTAssertEqual(computerDrawCount, 0)
        XCTAssertEqual(computerLoseCount, 0)
    }
    
    func test_reset시_기본값이_보인지() {
        // given
        sut.reset()
        
        // when
        let hand = sut.user.hand
        
        // then
        XCTAssertEqual(hand, .paper)
    }
    
    func test_유저가_1승하면_winCount가_1인가() {
        // given
        sut.user.increaseWinCount()
        
        // when
        let winCount = sut.user.winCount
        
        // then
        XCTAssertEqual(winCount, 1)
    }
    
    func test_유저가_1무하면_drawCount가_1인가() {
        // given
        sut.user.increaseDrawCount()
        
        // when
        let drawCount = sut.user.drawCount
        
        // then
        XCTAssertEqual(drawCount, 1)
    }
    
    func test_유저가_1패하면_loseCount가_1인가() {
        // given
        sut.user.increaseLoseCount()
        
        // when
        let loseCount = sut.user.loseCount
        
        // then
        XCTAssertEqual(loseCount, 1)
    }
    
    // MARK: - 비기는 케이스
    
    func test_유저와_컴퓨터가_주먹을_낸_경우_drawCount가_1_증가하는가() {
        // given
        sut.user.setHand(hand: .rock)
        sut.computer.setHand(hand: .rock)
        
        // when
        sut.decideWinner()
        let drawCount = sut.user.drawCount
        
        // then
        XCTAssertEqual(drawCount, 1)
    }
    
    func test_유저와_컴퓨터가_가위를_낸_경우_drawCount가_1_증가하는가() {
        // given
        sut.user.setHand(hand: .scissor)
        sut.computer.setHand(hand: .scissor)
        
        // when
        sut.decideWinner()
        let drawCount = sut.user.drawCount
        
        // then
        XCTAssertEqual(drawCount, 1)
    }
    
    func test_유저와_컴퓨터가_보를_낸_경우_drawCount가_1_증가하는가() {
        // given
        sut.user.setHand(hand: .paper)
        sut.computer.setHand(hand: .paper)
        
        // when
        sut.decideWinner()
        let drawCount = sut.user.drawCount
        
        // then
        XCTAssertEqual(drawCount, 1)
    }
    
    // MARK: - 유저가 이기는 케이스
    
    func test_유저가_가위_컴퓨터는_보를_내서_이기는경우_winCount가_1_증가하는가() {
        // given
        sut.user.setHand(hand: .scissor)
        sut.computer.setHand(hand: .paper)
        
        // when
        sut.decideWinner()
        let winCount = sut.user.winCount
        
        // then
        XCTAssertEqual(winCount, 1)
    }
    
    func test_유저가_보_컴퓨터는_주먹을_내서_이기는경우_winCount가_1_증가하는가() {
        // given
        sut.user.setHand(hand: .paper)
        sut.computer.setHand(hand: .rock)
        
        // when
        sut.decideWinner()
        let winCount = sut.user.winCount
        
        // then
        XCTAssertEqual(winCount, 1)
    }
    
    func test_유저가_주먹_컴퓨터는_가위를_내서_이기는경우_winCount가_1_증가하는가() {
        // given
        sut.user.setHand(hand: .rock)
        sut.computer.setHand(hand: .scissor)
        
        // when
        sut.decideWinner()
        let winCount = sut.user.winCount
        
        // then
        XCTAssertEqual(winCount, 1)
    }
    
    // MARK: - 유저가 지는 케이스
    
    func test_유저가_가위_컴퓨터는_주먹을_내서_지는경우_loseCount가_1_증가하는가() {
        // given
        sut.user.setHand(hand: .scissor)
        sut.computer.setHand(hand: .rock)
        
        // when
        sut.decideWinner()
        let loseCount = sut.user.loseCount
        
        // then
        XCTAssertEqual(loseCount, 1)
    }
    
    func test_유저가_주먹_컴퓨터는_보를_내서_지는경우_loseCount가_1_증가하는가() {
        // given
        sut.user.setHand(hand: .rock)
        sut.computer.setHand(hand: .paper)
        
        // when
        sut.decideWinner()
        let loseCount = sut.user.loseCount
        
        // then
        XCTAssertEqual(loseCount, 1)
    }
    
    func test_유저가_보_컴퓨터는_가위를_내서_지는경우_loseCount가_1_증가하는가() {
        // given
        sut.user.setHand(hand: .paper)
        sut.computer.setHand(hand: .scissor)
        
        // when
        sut.decideWinner()
        let loseCount = sut.user.loseCount
        
        // then
        XCTAssertEqual(loseCount, 1)
    }
    
}
