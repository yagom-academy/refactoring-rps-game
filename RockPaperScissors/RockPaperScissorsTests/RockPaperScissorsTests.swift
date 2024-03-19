//
//  RockPaperScissorsTests.swift
//  RockPaperScissorsTests
//
//  Created by Choi Oliver on 3/19/24.
//

import XCTest

final class RockPaperScissorsTests: XCTestCase {
    
    var rpsCalculator: RPSCalculator!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        rpsCalculator = RPSCalculatorImpl()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        rpsCalculator = nil
    }
    
    func test_나는_가위_상대는_보() {
        let result: RPSResult = rpsCalculator.calculate(.scissor, .paper)
        
        XCTAssertEqual(result, RPSResult.win)
    }
    
    func test_나는_가위_상대는_가위() {
        let result: RPSResult = rpsCalculator.calculate(.scissor, .paper)
        
        XCTAssertEqual(result, RPSResult.draw)
    }
    
    func test_나는_가위_상대는_바위() {
        let result: RPSResult = rpsCalculator.calculate(.scissor, .paper)
        
        XCTAssertEqual(result, RPSResult.lose)
    }
    
    func test_나는_바위_상대는_보() {
        let result: RPSResult = rpsCalculator.calculate(.scissor, .paper)
        
        XCTAssertEqual(result, RPSResult.lose)
    }
    
    func test_나는_바위_상대는_가위() {
        let result: RPSResult = rpsCalculator.calculate(.scissor, .paper)
        
        XCTAssertEqual(result, RPSResult.win)
    }
    
    func test_나는_바위_상대는_바위() {
        let result: RPSResult = rpsCalculator.calculate(.scissor, .paper)
        
        XCTAssertEqual(result, RPSResult.draw)
    }
    
    func test_나는_보_상대는_보() {
        let result: RPSResult = rpsCalculator.calculate(.scissor, .paper)
        
        XCTAssertEqual(result, RPSResult.draw)
    }
    
    func test_나는_보_상대는_가위() {
        let result: RPSResult = rpsCalculator.calculate(.scissor, .paper)
        
        XCTAssertEqual(result, RPSResult.lose)
    }
    
    func test_나는_보_상대는_바위() {
        let result: RPSResult = rpsCalculator.calculate(.scissor, .paper)
        
        XCTAssertEqual(result, RPSResult.win)
    }
}
