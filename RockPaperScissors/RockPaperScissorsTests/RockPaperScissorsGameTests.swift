//
//  RockPaperScissorsTests.swift
//  RockPaperScissorsTests
//
//  Created by 홍승완 on 2024/03/19.
//

import XCTest
@testable import RockPaperScissors

final class RockPaperScissorsGameTests: XCTestCase {
    var sut: RockPaperScissorsGame?

    // MARK: 보로 비겼을 때
    func test_paper_draw() throws {
        // given
        sut = RockPaperScissorsGame(user: User(hand: .paper), 
                   computer: User(hand: .paper))
        
        // when
        sut?.play()
        
        // then
        let userScore = sut?.user.score.drawCount
        let computerScore = sut?.computer.score.drawCount
        XCTAssertEqual(userScore, 1)
        XCTAssertEqual(computerScore, 1)
    }
    
    // MARK: 가위로 비겼을 때
    func test_scissor_draw() throws {
        // given
        sut = RockPaperScissorsGame(user: User(hand: .scissor),
                   computer: User(hand: .scissor))
        
        // when
        sut?.play()
        
        // then
        let userScore = sut?.user.score.drawCount
        let computerScore = sut?.computer.score.drawCount
        XCTAssertEqual(userScore, 1)
        XCTAssertEqual(computerScore, 1)
    }
    
    // MARK: 주먹으로 비겼을 때
    func test_rock_draw() throws {
        // given
        sut = RockPaperScissorsGame(user: User(hand: .rock),
                   computer: User(hand: .rock))
        
        // when
        sut?.play()
        
        // then
        let userScore = sut?.user.score.drawCount
        let computerScore = sut?.computer.score.drawCount
        XCTAssertEqual(userScore, 1)
        XCTAssertEqual(computerScore, 1)
    }
    
    // MARK: 유저가 보를 내서 이길 때
    func test_paper_user_win() throws {
        // given
        sut = RockPaperScissorsGame(user: User(hand: .paper), 
                   computer: User(hand: .rock))
        
        // when
        sut?.play()
        
        // then
        let userScore = sut?.user.score.winCount
        let computerScore = sut?.computer.score.loseCount
        XCTAssertEqual(userScore, 1)
        XCTAssertEqual(computerScore, 1)
    }
    
    // MARK: 유저가 가위를 내서 이길 때
    func test_scissor_user_win() throws {
        // given
        sut = RockPaperScissorsGame(user: User(hand: .scissor),
                   computer: User(hand: .paper))
        
        // when
        sut?.play()
        
        // then
        let userScore = sut?.user.score.winCount
        let computerScore = sut?.computer.score.loseCount
        XCTAssertEqual(userScore, 1)
        XCTAssertEqual(computerScore, 1)
    }
    
    // MARK: 유저가 바위를 내서 이길 때
    func test_rock_user_win() throws {
        // given
        sut = RockPaperScissorsGame(user: User(hand: .rock),
                   computer: User(hand: .scissor))
        
        // when
        sut?.play()
        
        // then
        let userScore = sut?.user.score.winCount
        let computerScore = sut?.computer.score.loseCount
        XCTAssertEqual(userScore, 1)
        XCTAssertEqual(computerScore, 1)
    }
    
    // MARK: 컴퓨터가 보를 내서 이길 때
    func test_paper_computer_win() throws {
        // given
        sut = RockPaperScissorsGame(user: User(hand: .rock),
                   computer: User(hand: .paper))
        
        // when
        sut?.play()
        
        // then
        let userScore = sut?.user.score.loseCount
        let computerScore = sut?.computer.score.winCount
        XCTAssertEqual(userScore, 1)
        XCTAssertEqual(computerScore, 1)
    }
    
    // MARK: 컴퓨터가 가위를 내서 이길 때
    func test_scissor_computer_win() throws {
        // given
        sut = RockPaperScissorsGame(user: User(hand: .paper),
                   computer: User(hand: .scissor))
        
        // when
        sut?.play()
        
        // then
        let userScore = sut?.user.score.loseCount
        let computerScore = sut?.computer.score.winCount
        XCTAssertEqual(userScore, 1)
        XCTAssertEqual(computerScore, 1)
    }
    
    // MARK: 컴퓨터가 바위를 내서 이길 때
    func test_rock_computer_win() throws {
        // given
        sut = RockPaperScissorsGame(user: User(hand: .scissor),
                   computer: User(hand: .rock))
        
        // when
        sut?.play()
        
        // then
        let userScore = sut?.user.score.loseCount
        let computerScore = sut?.computer.score.winCount
        XCTAssertEqual(userScore, 1)
        XCTAssertEqual(computerScore, 1)
    }
    
    // MARK: 랜덤 Hand 테스트
    func test_random() throws {
        // given
        let randomUserHand = Hand.allCases[Int.random(in: 0..<Hand.allCases.count)]
        let randomComputerHand = Hand.allCases[Int.random(in: 0..<Hand.allCases.count)]
        sut = RockPaperScissorsGame(user: User(hand: randomUserHand),
                   computer: User(hand: randomComputerHand))
        
        // when
        sut?.play()
        
        // then
        guard let userHand = sut?.user.currentHand?.description,
              let computerHand = sut?.computer.currentHand?.description else {
            return
        }
        
        let win = sut?.user.score.winCount
        let lose = sut?.user.score.loseCount
        let draw = sut?.user.score.drawCount
        print(">>>>>>>>>>>RANDOM TEST>>>>>>>>>>>>>>>>>>")
        print("| userHand: \(userHand)", "computerHand: \(computerHand) |")
        print("| user Win: \(win!) \t|\n",
              "| user Lose: \(lose!)\t |\n",
              "| user Draw:\(draw!)\t |")
        print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
    }
    
    // MARK: 삼세판 메서드 테스트
    func test_threeGame() throws {
        // given
        let randomUserHand = Hand.allCases[Int.random(in: 0..<Hand.allCases.count)]
        let randomComputerHand = Hand.allCases[Int.random(in: 0..<Hand.allCases.count)]
        
        sut = RockPaperScissorsGame(user: User(hand: randomUserHand),
                         computer: User(hand: randomComputerHand))
        
        guard let sut else { return }
        
        let user = sut.user
        let computer = sut.computer
        
        // when
        repeat {
            test_nextGame(sut: sut)
        } while user.score.winCount < 3
                 && computer.score.winCount < 3
        
        // then
        let userWin = user.score.winCount
        let computerWin = computer.score.winCount
        
        // User가 이김
        if user.score.winCount == 3 {
            XCTAssertEqual(userWin, 3)
        }
        // Computer가 이김
        else {
            XCTAssertEqual(computerWin, 3)
        }
    }
    
    // MARK: rest 메서드 테스트
    func test_reset() throws {
        // given
        try test_threeGame()
        
        guard let userWinCount = sut?.user.score.winCount,
              let computerWinCount = sut?.computer.score.winCount else {
            return
        }
        
        if userWinCount > computerWinCount {
            XCTAssertEqual(sut?.user.score.winCount, 3)
        } else {
            XCTAssertEqual(sut?.computer.score.winCount, 3)
        }
        
        // when
        sut?.reset()
        
        // then
        let user = sut?.user
        let computer = sut?.computer
        
        let userHand = user?.currentHand
        let computerHand = computer?.currentHand
        
        let userWin = user?.score.winCount
        let userLose = user?.score.loseCount
        let userDraw = user?.score.drawCount
        let computerWin = computer?.score.winCount
        let computerLose = computer?.score.loseCount
        let computerDraw = computer?.score.drawCount
        
        XCTAssertNil(userHand)
        XCTAssertNil(computerHand)
        
        XCTAssertEqual(userWin, 0)
        XCTAssertEqual(userDraw, 0)
        XCTAssertEqual(userLose, 0)
        XCTAssertEqual(computerWin, 0)
        XCTAssertEqual(computerLose, 0)
        XCTAssertEqual(computerDraw, 0)
    }
}

extension RockPaperScissorsGameTests {
    // MARK: nextGame 메서드 테스트
    private func test_nextGame(sut: RockPaperScissorsGame) {
        // given
        let user = sut.user
        let computer = sut.computer
        
        let userWin = user.score.winCount
        let userLose = user.score.loseCount
        let userDraw = user.score.drawCount
        let computerWin = computer.score.winCount
        let computerLose = computer.score.loseCount
        let computerDraw = computer.score.drawCount

        // when
        sut.nextGame()
        
        // then
        
        let nextUserWin = user.score.winCount
        let nextUserLose = user.score.loseCount
        let nextUserDraw = user.score.drawCount
        let nextComputerWin = computer.score.winCount
        let nextComputerLose = computer.score.loseCount
        let nextComputerDraw = computer.score.drawCount
        
        switch sut.judge() {
        case .userWin:
            XCTAssertEqual(userWin + 1, nextUserWin)
            XCTAssertEqual(computerLose + 1, nextComputerLose)
        case .userLose:
            XCTAssertEqual(userLose + 1, nextUserLose)
            XCTAssertEqual(computerWin + 1, nextComputerWin)
        case .draw:
            XCTAssertEqual(userDraw + 1, nextUserDraw)
            XCTAssertEqual(computerDraw + 1, nextComputerDraw)
        }
    }

}
