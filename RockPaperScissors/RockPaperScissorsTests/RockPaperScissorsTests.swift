//
//  RockPaperScissorsTests.swift
//  RockPaperScissorsTests
//
//  Created by 김창규 on 2/5/24.
//

import XCTest
@testable import RockPaperScissors

final class RockPaperScissorsTests: XCTestCase {
    var sut: RPSGame?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = RPSGame(
            leftHand: ComputerHand(
                name: "컴퓨터"),
            rightHand: UserHand(
                name: "나"),
            score: Score(
                winCount: 0,
                loseCount: 0,
                drawCount: 0,
                limit: 3),
            myHand: .right)
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    //MARK: - Rock
    func test_determineWinner에_rock_paper_입력하면_winCount가_1이다() {
        //given, when
        sut?.determineWinner(left: "✊", right: "🖐️")
        //then
        XCTAssertEqual(sut?.winCount, 1)
    }
    
    func test_determineWinner에_rock_rock_입력하면_drawCount가_1이다() {
        //given, when
        sut?.determineWinner(left: "✊", right: "✊")
        
        //then
        XCTAssertEqual(sut?.drawCount, 1)
    }
    
    func test_determineWinner에_rock_scissor_입력하면_loseCount가_1이다() {
        //given, when
        sut?.determineWinner(left: "✊", right: "✌️")
        
        //then
        XCTAssertEqual(sut?.loseCount, 1)
    }
    
    //MARK: - Paper
    func test_determineWinner에_paper_paper_입력하면_drawCount가_1이다() {
        //given, when
        sut?.determineWinner(left: "🖐️", right: "🖐️")
        
        //then
        XCTAssertEqual(sut?.drawCount, 1)
    }
    
    func test_determineWinner에_paper_rock_입력하면_loseCount가_1이다() {
        //given, when
        sut?.determineWinner(left: "🖐️", right: "✊")
        
        //then
        XCTAssertEqual(sut?.loseCount, 1)
    }
    
    func test_determineWinner에_paper_scissor_입력하면_winCount가_1이다() {
        //given, when
        sut?.determineWinner(left: "🖐️", right: "✌️")
        
        //then
        XCTAssertEqual(sut?.winCount, 1)
    }
    
    //MARK: - Scissor
    func test_determineWinner에_scissor_paper_입력하면_loseCount가_1이다() {
        //given, when
        sut?.determineWinner(left: "✌️", right: "🖐️")
        
        //then
        XCTAssertEqual(sut?.loseCount, 1)
    }
    
    func test_determineWinner에_scissor_rock_입력하면_winCount가_1이다() {
        //given, when
        sut?.determineWinner(left: "✌️", right: "✊")
        
        //then
        XCTAssertEqual(sut?.winCount, 1)
    }
    
    func test_determineWinner에_scissor_scissor_입력하면_drawCount가_1이다() {
        //given, when
        sut?.determineWinner(left: "✌️", right: "✌️")
        
        //then
        XCTAssertEqual(sut?.drawCount, 1)
    }
    
    
    //MARK: - 삼세판 기능 TDD
    func test_determineWinner를_3번_호출하면_게임횟수의_totalScoure가_3이다() {
        //given, when
        sut?.determineWinner(left: "✌️", right: "✌️")
        sut?.determineWinner(left: "✌️", right: "✌️")
        sut?.determineWinner(left: "✌️", right: "✌️")
        
        //then
        XCTAssertEqual(sut?.totalScore, 3)
    }
    
    func test_determineWinner를_3번_호출하면_gameFinished가_참이다() {
        //given, when
        sut?.determineWinner(left: "✌️", right: "✌️")
        sut?.determineWinner(left: "✌️", right: "✌️")
        sut?.determineWinner(left: "✌️", right: "✌️")
        
        //then
        XCTAssertEqual(sut?.gameFinished, true)
    }
    
    func test_determineWinner를_1번_호출하면_gameFinished가_거짓이다() {
        //given, when
        sut?.determineWinner(left: "✌️", right: "✌️")
        
        //then
        XCTAssertEqual(sut?.gameFinished, false)
        XCTAssertEqual(sut?.gameResult, .playing)
    }
    
    func test_determinWinner에서_승리3번_패배0번이면_gameResult가_win타입이다() {
        //given, when
        sut?.determineWinner(left: "✌️", right: "✊")
        sut?.determineWinner(left: "🖐️", right: "✌️")
        sut?.determineWinner(left: "✊", right: "🖐️")
        
        //then
        XCTAssertEqual(sut?.gameResult, .win)
    }
    
    func test_determinWinner에서_승리0번_패배3번이면_gameResult가_lose타입이다() {
        //given, when
        sut?.determineWinner(left: "🖐️", right: "✊")
        sut?.determineWinner(left: "✊", right: "✌️")
        sut?.determineWinner(left: "✌️", right: "🖐️")
        
        //then
        XCTAssertEqual(sut?.gameResult, .lose)
    }
    
    func test_determinWinner에서_무승부이면_gameResult가_draw타입이다() {
        //given, when
        sut?.determineWinner(left: "✊", right: "✊")
        sut?.determineWinner(left: "✌️", right: "✌️")
        sut?.determineWinner(left: "🖐️", right: "🖐️")
        
        //then
        XCTAssertEqual(sut?.gameResult, .draw)
    }
    
    //MARK: - 삼세판 끝나고 승패가 갈리면 초기화 하는 기능 TDD
    func test_resetScore를_호출하면_데이터초기화() {
        //given, when
        sut?.determineWinner(left: "✊", right: "✊")
        sut?.determineWinner(left: "✌️", right: "✌️")
        sut?.determineWinner(left: "🖐️", right: "🖐️")
        
        //when
        sut?.resetScore()
        
        XCTAssertEqual(sut?.winCount, 0)
        XCTAssertEqual(sut?.loseCount, 0)
        XCTAssertEqual(sut?.drawCount, 0)
        XCTAssertEqual(sut?.gameResult, .ready)
    }
    
    
}
