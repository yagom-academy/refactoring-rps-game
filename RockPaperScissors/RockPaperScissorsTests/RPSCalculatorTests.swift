//
//  RPSCalculatorTests.swift
//  RPSCalculatorTests
//
//  Created by Choi Oliver on 3/19/24.
//

import XCTest

final class RPSCalculatorTests: XCTestCase {

    var gameCalculator: GameCalculator!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        gameCalculator = RPSGameCalculator(maxGameCount: 3, winCondition: 2)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        gameCalculator = nil
    }
    
    func test_가위바위보_나는_가위_상대는_보() {
        // given
        let myHand: Hand = .scissor
        let opponentHand: Hand = .paper
        
        // when
        let result: SetResult = myHand.singleSetPlay(opponentHand: opponentHand)
        
        // then
        XCTAssertEqual(result, SetResult.win)
    }
    
    func test_가위바위보_나는_가위_상대는_가위() {
        // given
        let myHand: Hand = .scissor
        let opponentHand: Hand = .scissor
        
        // when
        let result: SetResult = myHand.singleSetPlay(opponentHand: opponentHand)
        
        // then
        XCTAssertEqual(result, SetResult.draw)
    }
    
    func test_가위바위보_나는_가위_상대는_바위() {
        // given
        let myHand: Hand = .scissor
        let opponentHand: Hand = .rock
        
        // when
        let result: SetResult = myHand.singleSetPlay(opponentHand: opponentHand)
        
        // then
        XCTAssertEqual(result, SetResult.lose)
    }
    
    func test_가위바위보_나는_바위_상대는_보() {
        // given
        let myHand: Hand = .rock
        let opponentHand: Hand = .paper
        
        // when
        let result: SetResult = myHand.singleSetPlay(opponentHand: opponentHand)
        
        // then
        XCTAssertEqual(result, SetResult.lose)
    }
    
    func test_가위바위보_나는_바위_상대는_가위() {
        // given
        let myHand: Hand = .rock
        let opponentHand: Hand = .scissor
        
        // when
        let result: SetResult = myHand.singleSetPlay(opponentHand: opponentHand)
        
        // then
        XCTAssertEqual(result, SetResult.win)
    }
    
    func test_가위바위보_나는_바위_상대는_바위() {
        // given
        let myHand: Hand = .rock
        let opponentHand: Hand = .rock
        
        // when
        let result: SetResult = myHand.singleSetPlay(opponentHand: opponentHand)
        
        // then
        XCTAssertEqual(result, SetResult.draw)
    }
    
    func test_가위바위보_나는_보_상대는_보() {
        // given
        let myHand: Hand = .paper
        let opponentHand: Hand = .paper
        
        // when
        let result: SetResult = myHand.singleSetPlay(opponentHand: opponentHand)
        
        // then
        XCTAssertEqual(result, SetResult.draw)
    }
    
    func test_가위바위보_나는_보_상대는_가위() {
        // given
        let myHand: Hand = .paper
        let opponentHand: Hand = .scissor
        
        // when
        let result: SetResult = myHand.singleSetPlay(opponentHand: opponentHand)
        
        // then
        XCTAssertEqual(result, SetResult.lose)
    }
    
    func test_가위바위보_나는_보_상대는_바위() {
        // given
        let myHand: Hand = .paper
        let opponentHand: Hand = .rock
        
        // when
        let result: SetResult = myHand.singleSetPlay(opponentHand: opponentHand)
        
        // then
        XCTAssertEqual(result, SetResult.win)
    }
    
    func test_가위바위보_삼세판_3승() {
        // given
        let hands: [(Hand, Hand)] = [
            (.rock, .scissor),
            (.rock, .scissor),
            (.rock, .scissor)
        ]
        
        // when
        hands.forEach {
            gameCalculator.play(myHand: $0.0, opponentHand: $0.1)
        }
        
        // then
        XCTAssertEqual(gameCalculator.gameState, .finished(isWin: true))
        gameCalculator.reset()
    }
    
    func test_가위바위보_삼세판_2승_1무() {
        // given
        let hands: [(Hand, Hand)] = [
            (.rock, .scissor),
            (.rock, .rock),
            (.rock, .scissor)
        ]
        
        // when
        hands.forEach {
            gameCalculator.play(myHand: $0.0, opponentHand: $0.1)
        }
        
        // then
        XCTAssertEqual(gameCalculator.gameState, .finished(isWin: true))
        gameCalculator.reset()
    }
    
    func test_가위바위보_삼세판_2승_1패() {
        // given
        let hands: [(Hand, Hand)] = [
            (.rock, .scissor),
            (.rock, .paper),
            (.rock, .scissor)
        ]
        
        // when
        hands.forEach {
            gameCalculator.play(myHand: $0.0, opponentHand: $0.1)
        }
        
        // then
        XCTAssertEqual(gameCalculator.gameState, .finished(isWin: true))
        gameCalculator.reset()
    }
    
    func test_가위바위보_삼세판_1승_2무() {
        // given
        let hands: [(Hand, Hand)] = [
            (.rock, .rock),
            (.rock, .scissor),
            (.rock, .rock)
        ]
        
        // when
        hands.forEach {
            gameCalculator.play(myHand: $0.0, opponentHand: $0.1)
        }
        
        // then
        XCTAssertEqual(gameCalculator.gameState, .finished(isWin: false))
        gameCalculator.reset()
    }
    
    func test_가위바위보_삼세판_1승_1무_1패() {
        // given
        let hands: [(Hand, Hand)] = [
            (.rock, .scissor),
            (.rock, .rock),
            (.rock, .paper)
        ]
        
        // when
        hands.forEach {
            gameCalculator.play(myHand: $0.0, opponentHand: $0.1)
        }
        
        // then
        XCTAssertEqual(gameCalculator.gameState, .finished(isWin: false))
        gameCalculator.reset()
    }
    
    func test_가위바위보_삼세판_1승_2패() {
        // given
        let hands: [(Hand, Hand)] = [
            (.rock, .scissor),
            (.rock, .scissor),
            (.rock, .scissor)
        ]
        
        // when
        hands.forEach {
            gameCalculator.play(myHand: $0.0, opponentHand: $0.1)
        }
        
        // then
        XCTAssertEqual(gameCalculator.gameState, .finished(isWin: true))
        gameCalculator.reset()
    }
    
    func test_가위바위보_삼세판_0승_3패() {
        // given
        let hands: [(Hand, Hand)] = [
            (.rock, .paper),
            (.rock, .paper),
            (.rock, .paper)
        ]
        
        // when
        hands.forEach {
            gameCalculator.play(myHand: $0.0, opponentHand: $0.1)
        }
        
        // then
        XCTAssertEqual(gameCalculator.gameState, .finished(isWin: false))
        gameCalculator.reset()
    }
    
    func test_가위바위보_삼세판_0승_1무_2패() {
        // given
        let hands: [(Hand, Hand)] = [
            (.rock, .rock),
            (.rock, .paper),
            (.rock, .paper)
        ]
        
        // when
        hands.forEach {
            gameCalculator.play(myHand: $0.0, opponentHand: $0.1)
        }
        
        // then
        XCTAssertEqual(gameCalculator.gameState, .finished(isWin: false))
        gameCalculator.reset()
    }
    
    func test_가위바위보_삼세판_0승_2무_1패() {
        // given
        let hands: [(Hand, Hand)] = [
            (.rock, .rock),
            (.rock, .paper),
            (.rock, .rock)
        ]
        
        // when
        hands.forEach {
            gameCalculator.play(myHand: $0.0, opponentHand: $0.1)
        }
        
        // then
        XCTAssertEqual(gameCalculator.gameState, .finished(isWin: false))
        gameCalculator.reset()
    }
}
