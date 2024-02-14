//
//  MJPTests.swift
//  RockPaperScissorsTests
//
//  Created by 김창규 on 2/9/24.
//

import XCTest
@testable import RockPaperScissors

final class MJPTests: XCTestCase {
    var sut: MJPGame?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = MJPGame(
            leftHand: ComputerHand(
                name: "컴퓨터"),
            rightHand: UserHand(
                name: "나"),
            score: Score(
                winCount: 0,
                loseCount: 0,
                drawCount: 0,
                limit: 3,
                totalGameCount: 0),
            myHand: .right,
            attacker: nil)
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
 
    //MARK: - Attacker
    func test_determineWinner에_rock_paper_입력하면_attacker가_rightHand이다() {
        //given, when
        sut?.determineWinner(left: "✊", right: "🖐️")
        //then
        XCTAssertEqual(sut?.attacker, .right)
    }
    
    func test_determineWinner에_scissor_rock_입력하면_attacker가_rightHand이다() {
        //given, when
        sut?.determineWinner(left: "✌️", right: "✊")
        //then
        XCTAssertEqual(sut?.attacker, .right)
    }
    
    func test_determineWinner에_paper_scissor_입력하면_attacker가_rightHand이다() {
        //given, when
        sut?.determineWinner(left: "🖐️", right: "✌️")
        //then
        XCTAssertEqual(sut?.attacker, .right)
    }
    
    func test_determineWinner에_rock_scissor_입력하면_attacker가_leftHand이다() {
        //given, when
        sut?.determineWinner(left: "✊", right: "✌️")
        //then
        XCTAssertEqual(sut?.attacker, .left)
    }
    
    func test_determineWinner에_scissor_paper_입력하면_attacker가_leftHand이다() {
        //given, when
        sut?.determineWinner(left: "✌️", right: "🖐️")
        //then
        XCTAssertEqual(sut?.attacker, .left)
    }
    
    func test_determineWinner에_paper_rock_입력하면_attacker가_leftHand이다() {
        //given, when
        sut?.determineWinner(left: "🖐️", right: "✊")
        //then
        XCTAssertEqual(sut?.attacker, .left)
    }
    
    func test_determineWinner에_rock_rock_입력하면_attacker가_nil이다() {
        //given, when
        sut?.determineWinner(left: "✊", right: "✊")
        
        //then
        XCTAssertEqual(sut?.attacker, nil)
    }
    
    func test_determineWinner에_scissor_scissor_입력하면_attacker가_nil이다() {
        //given, when
        sut?.determineWinner(left: "✌️", right: "✌️")
        //then
        XCTAssertEqual(sut?.attacker, nil)
    }
    
    func test_determineWinner에_paper_paper_입력하면_attacker가_nil이다() {
        //given, when
        sut?.determineWinner(left: "🖐️", right: "🖐️")
        //then
        XCTAssertEqual(sut?.attacker, nil)
    }
    
    //MARK: - Win/Lose
    func test_attacker가_right일때_determineWinner에_rock_rock_입력하면_winCount가_1이다() {
        //given
        sut?.determineWinner(left: "✊", right: "🖐️")
        
        //when
        sut?.determineWinner(left: "✊", right: "✊")
        
        //then
        XCTAssertEqual(sut?.winCount, 1)
        XCTAssertEqual(sut?.loseCount, 0)
    }
    
    func test_attacker가_right일때_determineWinner에_scissor_scissor_입력하면_winCount가_1이다() {
        //given
        sut?.determineWinner(left: "✊", right: "🖐️")
        
        //when
        sut?.determineWinner(left: "✌️", right: "✌️")
        
        //then
        XCTAssertEqual(sut?.winCount, 1)
        XCTAssertEqual(sut?.loseCount, 0)
    }
    
    func test_attacker가_right일때_determineWinner에_paper_paper_입력하면_winCount가_1이다() {
        //given
        sut?.determineWinner(left: "✊", right: "🖐️")
        
        //when
        sut?.determineWinner(left: "🖐️", right: "🖐️")
        
        //then
        XCTAssertEqual(sut?.winCount, 1)
        XCTAssertEqual(sut?.loseCount, 0)
    }
    
    func test_attacker가_left일때_determineWinner에_rock_rock_입력하면_loseCount가_1이다() {
        //given
        sut?.determineWinner(left: "🖐️", right: "✊")
        
        //when
        sut?.determineWinner(left: "✊", right: "✊")
        
        //then
        XCTAssertEqual(sut?.winCount, 0)
        XCTAssertEqual(sut?.loseCount, 1)
    }
    
    func test_attacker가_left일때_determineWinner에_scissor_scissor_입력하면_loseCount가_1이다() {
        //given
        sut?.determineWinner(left: "🖐️", right: "✊")
        
        //when
        sut?.determineWinner(left: "✌️", right: "✌️")
        
        //then
        XCTAssertEqual(sut?.winCount, 0)
        XCTAssertEqual(sut?.loseCount, 1)
    }
    
    func test_attacker가_left일때_determineWinner에_paper_paper_입력하면_loseCount가_1이다() {
        //given
        sut?.determineWinner(left: "🖐️", right: "✊")
        
        //when
        sut?.determineWinner(left: "🖐️", right: "🖐️")
        
        //then
        XCTAssertEqual(sut?.winCount, 0)
        XCTAssertEqual(sut?.loseCount, 1)
    }
    
    //MARK: - 삼세판
    func test_determineWinner를_3번_호출하면_게임횟수의_totalScore가_3이다() {
        //given,when
        sut?.determineWinner(left: "✊", right: "🖐️")
        sut?.determineWinner(left: "🖐️", right: "🖐️")
        
        sut?.determineWinner(left: "✊", right: "🖐️")
        sut?.determineWinner(left: "🖐️", right: "🖐️")
        
        sut?.determineWinner(left: "✊", right: "🖐️")
        sut?.determineWinner(left: "🖐️", right: "🖐️")
        
        //then
        XCTAssertEqual(sut?.totalScore, 3)
    }
    
    //MARK: - GameFinished
    func test_determineWinner를_3번_호출하면_gameFinished가_참이다() {
        //given
        sut?.determineWinner(left: "✊", right: "🖐️")
        //when
        sut?.determineWinner(left: "🖐️", right: "🖐️")
        
        //given
        sut?.determineWinner(left: "✊", right: "🖐️")
        //when
        sut?.determineWinner(left: "🖐️", right: "🖐️")
        
        //given
        sut?.determineWinner(left: "✊", right: "🖐️")
        //when
        sut?.determineWinner(left: "🖐️", right: "🖐️")
        
        //then
        XCTAssertEqual(sut?.gameFinished, true)
    }
    
    func test_determineWinner를_1번_호출하면_gameFinished가_거짓이다() {
        //given,when
        sut?.determineWinner(left: "✊", right: "🖐️")
        sut?.determineWinner(left: "🖐️", right: "🖐️")
        
        //then
        XCTAssertEqual(sut?.gameFinished, false)
    }
    
    //MARK: - GameResult
    func test_determinWinner에서_승리3번_패배0번이면_gameResult가_win타입이다() {
        //given
        sut?.determineWinner(left: "✊", right: "🖐️")
        //when
        sut?.determineWinner(left: "🖐️", right: "🖐️")
        
        //given
        sut?.determineWinner(left: "✊", right: "🖐️")
        //when
        sut?.determineWinner(left: "🖐️", right: "🖐️")
        
        //given
        sut?.determineWinner(left: "✊", right: "🖐️")
        //when
        sut?.determineWinner(left: "🖐️", right: "🖐️")
        
        //then
        XCTAssertEqual(sut?.gameResult, .win)
    }
    
    func test_determinWinner에서_승리0번_패배3번이면_gameResult가_lose타입이다() {
        //given
        sut?.determineWinner(left: "🖐️", right: "✊")
        //when
        sut?.determineWinner(left: "🖐️", right: "🖐️")
        
        //given
        sut?.determineWinner(left: "🖐️", right: "✊")
        //when
        sut?.determineWinner(left: "🖐️", right: "🖐️")
        
        //given
        sut?.determineWinner(left: "🖐️", right: "✊")
        //when
        sut?.determineWinner(left: "🖐️", right: "🖐️")
        
        //then
        XCTAssertEqual(sut?.gameResult, .lose)
    }
    
    //MARK: - Reset
    func test_resetScore를_호출하면_데이터초기화() {
        //given
        sut?.determineWinner(left: "🖐️", right: "✊")
        sut?.determineWinner(left: "🖐️", right: "🖐️")
        
        sut?.determineWinner(left: "🖐️", right: "✊")
        sut?.determineWinner(left: "🖐️", right: "✊")
        
        //when
        sut?.resetScore()
        
        //then
        XCTAssertEqual(sut?.winCount, 0)
        XCTAssertEqual(sut?.loseCount, 0)
        XCTAssertEqual(sut?.gameResult, .ready)
        XCTAssertEqual(sut?.attacker, nil)
    }
}
