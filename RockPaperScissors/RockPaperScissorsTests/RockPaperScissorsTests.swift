//
//  UpDownGameUITests.swift
//  UpDownGameUITests
//
//  Created by Park Sungmin on 3/19/24.
//

import XCTest

@testable import RockPaperScissors

final class RockPaperScissorsTests: XCTestCase {
    var sut: RPSGameRule!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = RPSGameRule(targetScore: 3)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func test_양쪽에서_패를냈을때_묵_묵을_낸경우_비기기(){
        // given
        let myAction: Actions = .rock
        let yourAction: Actions = .rock
        
        // when
        let result = sut.matchRule(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(result, MatchResult.draw)
    }
    
    func test_양쪽에서_패를냈을때_묵_찌을_낸경우_이기기(){
        // given
        let myAction: Actions = .rock
        let yourAction: Actions = .sissor
        
        // when
        let result = sut.matchRule(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(result, MatchResult.win)
    }
    
    func test_양쪽에서_패를냈을때_묵_빠을_낸경우_지기(){
        // given
        let myAction: Actions = .rock
        let yourAction: Actions = .paper
        
        // when
        let result = sut.matchRule(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(result, MatchResult.lose)
    }
    
    func test_양쪽에서_패를냈을때_찌_묵을_낸경우_지기(){
        // given
        let myAction: Actions = .sissor
        let yourAction: Actions = .rock
        
        // when
        let result = sut.matchRule(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(result, MatchResult.lose)
    }
    
    func test_양쪽에서_패를냈을때_찌_찌을_낸경우_비기기(){
        // given
        let myAction: Actions = .sissor
        let yourAction: Actions = .sissor
        
        // when
        let result = sut.matchRule(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(result, MatchResult.draw)
    }
    
    func test_양쪽에서_패를냈을때_찌_빠을_낸경우_이기(){
        // given
        let myAction: Actions = .sissor
        let yourAction: Actions = .paper
        
        // when
        let result = sut.matchRule(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(result, MatchResult.win)
    }
    
    func test_양쪽에서_패를냈을때_빠_묵을_낸경우_이기기(){
        // given
        let myAction: Actions = .paper
        let yourAction: Actions = .rock
        
        // when
        let result = sut.matchRule(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(result, MatchResult.win)
    }
    
    func test_양쪽에서_패를냈을때_빠_찌을_낸경우_지기기(){
        // given
        let myAction: Actions = .paper
        let yourAction: Actions = .sissor
        
        // when
        let result = sut.matchRule(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(result, MatchResult.lose)
    }
    
    func test_양쪽에서_패를냈을때_빠_빠을_낸경우_비기기(){
        // given
        let myAction: Actions = .paper
        let yourAction: Actions = .paper
        
        // when
        let result = sut.matchRule(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(result, MatchResult.draw)
    }
    
    func test_내가먼저_3판을이긴경우_삼세판이기기() {
        // given
        sut.score.win = 3
        sut.score.lose = 2
        
        // when
        let result = sut.score.matchResult
        
        // then
        XCTAssertEqual(result, MatchResult.win)
    }
    
    func test_내가먼저_3판을진경우_삼세판이기기() {
        // given
        sut.score.win = 2
        sut.score.lose = 3
        
        // when
        let result = sut.score.matchResult
        
        // then
        XCTAssertEqual(result, MatchResult.lose)
    }
    
    func test_아직_3판을이긴상황이없는경우_삼세판비기기() {
        // given
        sut.score.win = 0
        sut.score.lose = 0
        
        // when
        let result = sut.score.matchResult
        
        // then
        XCTAssertEqual(result, MatchResult.draw)
    }
    
    func test_playGame이_승리시_winscore를1올려주는지() {
        // given
        sut.playGame(myAction: .paper, opponentAction: .rock)
        
        // result
        let result = sut.score.win
        
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_playGame이_패배시_losescore를1올려주는지() {
        // given
        sut.playGame(myAction: .sissor, opponentAction: .rock)
        
        // result
        let result = sut.score.lose
        
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_playGame이_비길시_drawscore를1올려주는지() {
        // given
        sut.playGame(myAction: .rock, opponentAction: .rock)
        
        // result
        let result = sut.score.draw
        
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_playGame이_승리했을때_gameState를_done으로변경하는지() {
        // given
        sut.score.win = 2
        
        // result
        sut.playGame(myAction: .rock, opponentAction: .sissor)
        let result = sut.gameState
        
        // then
        XCTAssertEqual(result, .done)
    }
    
    func test_playGame이_패배했을때_gameState를_done으로변경하는지() {
        // given
        sut.score.lose = 2
        
        // result
        sut.playGame(myAction: .rock, opponentAction: .paper)
        let result = sut.gameState
        
        // then
        XCTAssertEqual(result, .done)
    }
    
    func test_playGame이_게임중일때_gameState를_playing으로유지하는지() {
        // given
        sut.score.win = 2
        sut.score.lose = 2
        
        // result
        sut.playGame(myAction: .rock, opponentAction: .rock)
        let result = sut.gameState
        
        // then
        XCTAssertEqual(result, .playing)
    }
}
