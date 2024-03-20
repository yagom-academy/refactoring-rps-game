//
//  RockPaperScissorsTests.swift
//  RockPaperScissorsTests
//
//  Created by 홍승완 on 2024/03/19.
//

import XCTest
@testable import RockPaperScissors

/// TDD의 RED-GREEN-REFACTOR 세 단계를 지켜가며 기능을 구현해봅니다
/// UI와의 연동 없이 비지니스 로직만 구현합니다
///
/// 양쪽이 낸 패의 승패 판결을 위한 기능을 TDD로 구현합니다
/// 해당 타입, 메서드를 구현해가며 지속적으로 리팩터링 합니다
/// 삼세판을 이기면 승리하는 기능을 TDD로 구현합니다
/// 삼세판이 끝나고 승패가 갈리면 초기화 하는 기능을 TDD로 구현합니다
/// 성능에 유리한 코드로 작성하도록 노력합니다
/// 기획의 변경에 대해서 최대한 열린 코드로 작성해봅니다

final class RockPaperScissorsTests: XCTestCase {
    var sut: Game?

    // MARK: 보로 비겼을 때
    func test_paper_draw() throws {
        // given
        sut = Game(user: User(hand: .paper), 
                   computer: User(hand: .paper))
        
        // when
        sut?.game()
        
        // then
        let userScore = sut?.user.score.drawCount
        let computerScore = sut?.computer.score.drawCount
        XCTAssertEqual(userScore, 1)
        XCTAssertEqual(computerScore, 1)
    }
    
    // MARK: 가위로 비겼을 때
    func test_scissor_draw() throws {
        // given
        sut = Game(user: User(hand: .scissor),
                   computer: User(hand: .scissor))
        
        // when
        sut?.game()
        
        // then
        let userScore = sut?.user.score.drawCount
        let computerScore = sut?.computer.score.drawCount
        XCTAssertEqual(userScore, 1)
        XCTAssertEqual(computerScore, 1)
    }
    
    // MARK: 주먹으로 비겼을 때
    func test_rock_draw() throws {
        // given
        sut = Game(user: User(hand: .rock),
                   computer: User(hand: .rock))
        
        // when
        sut?.game()
        
        // then
        let userScore = sut?.user.score.drawCount
        let computerScore = sut?.computer.score.drawCount
        XCTAssertEqual(userScore, 1)
        XCTAssertEqual(computerScore, 1)
    }
    
    // MARK: 유저가 보를 내서 이길 때
    func test_paper_user_win() throws {
        // given
        sut = Game(user: User(hand: .paper), 
                   computer: User(hand: .rock))
        
        // when
        sut?.game()
        
        // then
        let userScore = sut?.user.score.winCount
        let computerScore = sut?.computer.score.loseCount
        XCTAssertEqual(userScore, 1)
        XCTAssertEqual(computerScore, 1)
    }
    
    // MARK: 유저가 가위를 내서 이길 때
    func test_scissor_user_win() throws {
        // given
        sut = Game(user: User(hand: .scissor),
                   computer: User(hand: .paper))
        
        // when
        sut?.game()
        
        // then
        let userScore = sut?.user.score.winCount
        let computerScore = sut?.computer.score.loseCount
        XCTAssertEqual(userScore, 1)
        XCTAssertEqual(computerScore, 1)
    }
    
    // MARK: 유저가 바위를 내서 이길 때
    func test_rock_user_win() throws {
        // given
        sut = Game(user: User(hand: .rock),
                   computer: User(hand: .scissor))
        
        // when
        sut?.game()
        
        // then
        let userScore = sut?.user.score.winCount
        let computerScore = sut?.computer.score.loseCount
        XCTAssertEqual(userScore, 1)
        XCTAssertEqual(computerScore, 1)
    }
    
    // MARK: 컴퓨터가 보를 내서 이길 때
    func test_paper_computer_win() throws {
        // given
        sut = Game(user: User(hand: .rock),
                   computer: User(hand: .paper))
        
        // when
        sut?.game()
        
        // then
        let userScore = sut?.user.score.loseCount
        let computerScore = sut?.computer.score.winCount
        XCTAssertEqual(userScore, 1)
        XCTAssertEqual(computerScore, 1)
    }
    
    // MARK: 컴퓨터가 가위를 내서 이길 때
    func test_scissor_computer_win() throws {
        // given
        sut = Game(user: User(hand: .paper),
                   computer: User(hand: .scissor))
        
        // when
        sut?.game()
        
        // then
        let userScore = sut?.user.score.loseCount
        let computerScore = sut?.computer.score.winCount
        XCTAssertEqual(userScore, 1)
        XCTAssertEqual(computerScore, 1)
    }
    
    // MARK: 컴퓨터가 바위를 내서 이길 때
    func test_rock_computer_win() throws {
        // given
        sut = Game(user: User(hand: .scissor),
                   computer: User(hand: .rock))
        
        // when
        sut?.game()
        
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
        sut = Game(user: User(hand: randomUserHand),
                   computer: User(hand: randomComputerHand))
        
        // when
        sut?.game()
        
        // then
        guard let userHand = sut?.user.hand?.description,
              let computerHand = sut?.computer.hand?.description else {
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
    
    // MARK: nextGame 메서드 테스트
    func test_nextGame(sut: Game) {
        // given
        let randomUserHand = Hand.allCases[Int.random(in: 0..<Hand.allCases.count)]
        let randomComputerHand = Hand.allCases[Int.random(in: 0..<Hand.allCases.count)]
        
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
        if sut.draw() == true {
            XCTAssertEqual(userDraw + 1, nextUserDraw)
            XCTAssertEqual(computerDraw + 1, nextComputerDraw)
        } else if sut.userWin() == true {
            XCTAssertEqual(userWin + 1, nextUserWin)
            XCTAssertEqual(computerLose + 1, nextComputerLose)
        } else if sut.userLose() == true {
            XCTAssertEqual(userLose + 1, nextUserLose)
            XCTAssertEqual(computerWin + 1, nextComputerWin)
        }
    }
    
    // MARK: 삼세판 메서드 테스트
    func test_threeGame() throws {
        // given
        let randomUserHand = Hand.allCases[Int.random(in: 0..<Hand.allCases.count)]
        let randomComputerHand = Hand.allCases[Int.random(in: 0..<Hand.allCases.count)]
        sut = Game(user: User(hand: randomUserHand),
                         computer: User(hand: randomComputerHand))
        guard let user = sut?.user else { return }
        guard let computer = sut?.computer else { return }
        
        // when
        repeat {
            test_nextGame(sut: sut!)
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
        try! test_threeGame()
        
        if sut!.user.score.winCount > sut!.computer.score.winCount {
            XCTAssertEqual(sut?.user.score.winCount, 3)
        } else {
            XCTAssertEqual(sut?.computer.score.winCount, 3)
        }
        
        // when
        sut?.resetGame()
        
        // then
        XCTAssertEqual(sut?.user.score.drawCount, 0)
        XCTAssertEqual(sut?.user.score.winCount, 0)
        XCTAssertEqual(sut?.user.score.loseCount, 0)
        XCTAssertEqual(sut?.computer.score.drawCount, 0)
        XCTAssertEqual(sut?.computer.score.winCount, 0)
        XCTAssertEqual(sut?.computer.score.loseCount, 0)
    }

}
