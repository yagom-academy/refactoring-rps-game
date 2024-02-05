//
//  RockPaperScissorsTests.swift
//  RockPaperScissorsTests
//
//  Created by 김창규 on 2/5/24.
//

import XCTest
@testable import RockPaperScissors

final class RockPaperScissorsTests: XCTestCase {

    var sutLeft: HandGame!
    var sutRight: HandGame!
    
    override func setUpWithError() throws {
        sutLeft = LeftHandGame(
            handStrategy: UserHand(
                winCount: 0,
                loseCount: 0,
                drawCount: 0),
            gameResult: .ready)
        
        sutRight = RightHandGame(
            handStrategy: UserHand(
                winCount: 0,
                loseCount: 0,
                drawCount: 0),
            gameResult: .ready)
    }

    override func tearDownWithError() throws {
        sutLeft = nil
        sutRight = nil
    }

    //MARK: - Rock
    func test_determineWinner에_rock_paper_입력하면_승리한다() {
        //given, when
        sutLeft.determineWinner(left: "✊", right: "🖐️")
        sutRight.determineWinner(left: "✊", right: "🖐️")
        //then
        XCTAssertEqual(sutLeft.gameResult, .lose)
        XCTAssertEqual(sutRight.gameResult, .win)
    }
    
    func test_determineWinner에_rock_rock_입력하면_무승부한다() {
        //given, when
        sutLeft.determineWinner(left: "✊", right: "✊")
        sutRight.determineWinner(left: "✊", right: "✊")
        //then
        XCTAssertEqual(sutLeft.gameResult, .draw)
        XCTAssertEqual(sutRight.gameResult, .draw)
    }
    
    func test_determineWinner에_rock_scissor_입력하면_패배한다() {
        //given, when
        sutLeft.determineWinner(left: "✊", right: "✌️")
        sutRight.determineWinner(left: "✊", right: "✌️")
        //then
        XCTAssertEqual(sutLeft.gameResult, .win)
        XCTAssertEqual(sutRight.gameResult, .lose)
    }

    //MARK: - Paper
    func test_determineWinner에_paper_paper_입력하면_무승부한다() {
        //given, when
        sutLeft.determineWinner(left: "🖐️", right: "🖐️")
        sutRight.determineWinner(left: "🖐️", right: "🖐️")
        //then
        XCTAssertEqual(sutLeft.gameResult, .draw)
        XCTAssertEqual(sutRight.gameResult, .draw)
    }
    
    func test_determineWinner에_paper_rock_입력하면_패배한다() {
        //given, when
        sutLeft.determineWinner(left: "🖐️", right: "✊")
        sutRight.determineWinner(left: "🖐️", right: "✊")
        //then
        XCTAssertEqual(sutLeft.gameResult, .win)
        XCTAssertEqual(sutRight.gameResult, .lose)
    }
    
    func test_determineWinner에_paper_scissor_입력하면_승리한다() {
        //given, when
        sutLeft.determineWinner(left: "🖐️", right: "✌️")
        sutRight.determineWinner(left: "🖐️", right: "✌️")
        //then
        XCTAssertEqual(sutLeft.gameResult, .lose)
        XCTAssertEqual(sutRight.gameResult, .win)
    }
    
    //MARK: - Scissor
    func test_determineWinner에_scissor_paper_입력하면_패배한다() {
        //given, when
        sutLeft.determineWinner(left: "✌️", right: "🖐️")
        sutRight.determineWinner(left: "✌️", right: "🖐️")
        //then
        XCTAssertEqual(sutLeft.gameResult, .win)
        XCTAssertEqual(sutRight.gameResult, .lose)
    }
    
    func test_determineWinner에_scissor_rock_입력하면_승리한다() {
        //given, when
        sutLeft.determineWinner(left: "✌️", right: "✊")
        sutRight.determineWinner(left: "✌️", right: "✊")
        //then
        XCTAssertEqual(sutLeft.gameResult, .lose)
        XCTAssertEqual(sutRight.gameResult, .win)
    }
    
    func test_determineWinner에_scissor_scissor_입력하면_무승부한다() {
        //given, when
        sutLeft.determineWinner(left: "✌️", right: "✌️")
        sutRight.determineWinner(left: "✌️", right: "✌️")
        //then
        XCTAssertEqual(sutLeft.gameResult, .draw)
        XCTAssertEqual(sutRight.gameResult, .draw)
    }
    
}
