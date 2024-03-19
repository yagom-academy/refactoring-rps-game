//
//  UpDownGameUITests.swift
//  UpDownGameUITests
//
//  Created by Park Sungmin on 3/19/24.
//

import XCTest

@testable import RockPaperScissors

final class UpDownGameUITests: XCTestCase {
    var sut: RPSGameRule!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = RPSGameRule()
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
        let result = sut.matchRPS(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(result, MatchResult.draw)
    }
    
    func test_양쪽에서_패를냈을때_묵_찌을_낸경우_이기기(){
        // given
        let myAction: Actions = .rock
        let yourAction: Actions = .sissor
        
        // when
        let result = sut.matchRPS(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(result, MatchResult.win)
    }
    
    func test_양쪽에서_패를냈을때_묵_빠을_낸경우_지기(){
        // given
        let myAction: Actions = .rock
        let yourAction: Actions = .paper
        
        // when
        let result = sut.matchRPS(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(result, MatchResult.lose)
    }
    
    func test_양쪽에서_패를냈을때_찌_묵을_낸경우_지기(){
        // given
        let myAction: Actions = .sissor
        let yourAction: Actions = .rock
        
        // when
        let result = sut.matchRPS(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(result, MatchResult.lose)
    }
    
    func test_양쪽에서_패를냈을때_찌_찌을_낸경우_비기기(){
        // given
        let myAction: Actions = .sissor
        let yourAction: Actions = .sissor
        
        // when
        let result = sut.matchRPS(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(result, MatchResult.draw)
    }
    
    func test_양쪽에서_패를냈을때_찌_빠을_낸경우_이기(){
        // given
        let myAction: Actions = .rock
        let yourAction: Actions = .paper
        
        // when
        let result = sut.matchRPS(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(result, MatchResult.win)
    }
    
    func test_양쪽에서_패를냈을때_빠_묵을_낸경우_이기기(){
        // given
        let myAction: Actions = .paper
        let yourAction: Actions = .rock
        
        // when
        let result = sut.matchRPS(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(result, MatchResult.win)
    }
    
    func test_양쪽에서_패를냈을때_빠_찌을_낸경우_지기기(){
        // given
        let myAction: Actions = .paper
        let yourAction: Actions = .sissor
        
        // when
        let result = sut.matchRPS(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(result, MatchResult.lose)
    }
    
    func test_양쪽에서_패를냈을때_빠_빠을_낸경우_비기기(){
        // given
        let myAction: Actions = .paper
        let yourAction: Actions = .paper
        
        // when
        let result = sut.matchRPS(myAction: myAction, opponentAction: yourAction)
        
        // then
        XCTAssertEqual(result, MatchResult.draw)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
