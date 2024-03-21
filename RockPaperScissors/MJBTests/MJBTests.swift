//
//  MJBTests.swift
//  MJBTests
//
//  Created by Park Sungmin on 3/20/24.
//

import XCTest

@testable import RockPaperScissors

final class MJBTests: XCTestCase {

    var sut: MJBGameRule!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MJBGameRule(targetScore: 1)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func test_차례가_없으면_종료하기() {
        // given
        sut.isMyTurn = nil
        
        // when
        let playResult = sut.playGame(myAction: .paper, opponentAction: .rock)
        
        // then
        XCTAssertNil(playResult)
    }

    func test_양쪽에서_패를냈을때_묵_묵을_낸경우_match비기기(){
        // given
        let myAction: Actions = .rock
        let yourAction: Actions = .rock
        
        // when
        let result = sut.matchRule(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(result, MatchResult.draw)
    }
    
    func test_양쪽에서_패를냈을때_묵_찌을_낸경우_match이기기(){
        // given
        let myAction: Actions = .rock
        let yourAction: Actions = .sissor
        
        // when
        let result = sut.matchRule(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(result, MatchResult.win)
    }
    
    func test_양쪽에서_패를냈을때_묵_빠을_낸경우_match지기(){
        // given
        let myAction: Actions = .rock
        let yourAction: Actions = .paper
        
        // when
        let result = sut.matchRule(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(result, MatchResult.lose)
    }
    
    func test_양쪽에서_패를냈을때_찌_묵을_낸경우_match지기(){
        // given
        let myAction: Actions = .sissor
        let yourAction: Actions = .rock
        
        // when
        let result = sut.matchRule(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(result, MatchResult.lose)
    }
    
    func test_양쪽에서_패를냈을때_찌_찌을_낸경우_match비기기(){
        // given
        let myAction: Actions = .sissor
        let yourAction: Actions = .sissor
        
        // when
        let result = sut.matchRule(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(result, MatchResult.draw)
    }
    
    func test_양쪽에서_패를냈을때_찌_빠을_낸경우_match이기(){
        // given
        let myAction: Actions = .sissor
        let yourAction: Actions = .paper
        
        // when
        let result = sut.matchRule(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(result, MatchResult.win)
    }
    
    func test_양쪽에서_패를냈을때_빠_묵을_낸경우_match이기기(){
        // given
        let myAction: Actions = .paper
        let yourAction: Actions = .rock
        
        // when
        let result = sut.matchRule(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(result, MatchResult.win)
    }
    
    func test_양쪽에서_패를냈을때_빠_찌을_낸경우_match지기(){
        // given
        let myAction: Actions = .paper
        let yourAction: Actions = .sissor
        
        // when
        let result = sut.matchRule(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(result, MatchResult.lose)
    }
    
    func test_양쪽에서_패를냈을때_빠_빠을_낸경우_match비기기(){
        // given
        let myAction: Actions = .paper
        let yourAction: Actions = .paper
        
        // when
        let result = sut.matchRule(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(result, MatchResult.draw)
    }
    
    func test_내차례에_match에서비기면_승리하기() {
        // given
        sut.isMyTurn = true
        let myAction: Actions = .paper
        let yourAction: Actions = .paper
        
        
        // when
        let _ = sut.playGame(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(sut.gameStatus.gameResult, .win)
    }
    
    func test_내차례에_match에서이기면_score변화없이내차례유지하기() {
        // given
        sut.isMyTurn = true
        let myAction: Actions = .paper
        let yourAction: Actions = .rock
        
        let originScore = sut.gameStatus.score
        
        // when
        let _ = sut.playGame(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(sut.isMyTurn, true)
        XCTAssertEqual(sut.gameStatus.score.win, originScore.win)
        XCTAssertEqual(sut.gameStatus.gameResult, .playing)
    }
    
    func test_상대차례에_match에서이기면_score변화없이내차례유지하기() {
        // given
        sut.isMyTurn = false
        let myAction: Actions = .paper
        let yourAction: Actions = .rock
        
        let originScore = sut.gameStatus.score
        
        // when
        let _ = sut.playGame(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(sut.isMyTurn, true)
        XCTAssertEqual(sut.gameStatus.score.win, originScore.win)
        XCTAssertEqual(sut.gameStatus.gameResult, .playing)
    }
    
    func test_내차례에_match에서지면_score변화없이상대차례유지하기() {
        // given
        sut.isMyTurn = true
        let myAction: Actions = .rock
        let yourAction: Actions = .paper
        
        let originScore = sut.gameStatus.score
        
        // when
        let _ = sut.playGame(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(sut.isMyTurn, false)
        XCTAssertEqual(sut.gameStatus.score.lose, originScore.lose)
        XCTAssertEqual(sut.gameStatus.gameResult, .playing)
    }
    
    func test_상대차례에_match에서지면_score변화없이상대차례유지하기() {
        // given
        sut.isMyTurn = false
        let myAction: Actions = .rock
        let yourAction: Actions = .paper
        
        let originScore = sut.gameStatus.score
        
        // when
        let _ = sut.playGame(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(sut.isMyTurn, false)
        XCTAssertEqual(sut.gameStatus.score.lose, originScore.lose)
        XCTAssertEqual(sut.gameStatus.gameResult, .playing)
    }
    
    func test_내차례에_match에서비기면_게임승리하기() {
        // given
        sut.isMyTurn = true
        let myAction: Actions = .rock
        let yourAction: Actions = .rock
        
        // when
        let _ = sut.playGame(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(sut.gameStatus.gameResult, .win)
    }
    
    func test_상대차례에_match에서비기면_게임패배하기() {
        // given
        sut.isMyTurn = false
        let myAction: Actions = .rock
        let yourAction: Actions = .rock
        
        // when
        let _ = sut.playGame(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(sut.gameStatus.gameResult, .lose)
    }
    
    func test_() {
        // given
        
        // when
        
        // then
    }
}
