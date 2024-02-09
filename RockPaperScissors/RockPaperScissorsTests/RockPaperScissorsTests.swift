//
//  RockPaperScissorsTests.swift
//  RockPaperScissorsTests
//
//  Created by Kant on 2/8/24.
//

import XCTest
@testable import RockPaperScissors

final class RockPaperScissorsTests: XCTestCase {
    
    private var userWins: Int = 0
    private var computerWins: Int = 0
    private var isUserAttack: Bool = true
    private var winner: String = ""
    private var isDraw: Bool = false
    
    private func playRSPGame(userPick: String, computerPick: String) {
        
        if userPick == computerPick {
            isDraw = true
            return
        }
        
        switch userPick {
        case Hand.scissor:
            if computerPick == Hand.paper { setupUserWin() }
            if computerPick == Hand.rock { setupComputerWin() }
        case Hand.rock:
            if computerPick == Hand.scissor { setupUserWin() }
            if computerPick == Hand.paper { setupComputerWin() }
        case Hand.paper:
            if computerPick == Hand.rock { setupUserWin() }
            if computerPick == Hand.scissor { setupComputerWin() }
        default:
            break
        }
    }
    
    func setupUserWin() {
        userWins += 1
        isUserAttack = true
    }
    
    func setupComputerWin() {
        computerWins += 1
        isUserAttack = false
    }
    
    private func playMJBGame(userPick: String, computerPick: String) {
        switch userPick {
        case Hand.scissor:
            if computerPick == Hand.scissor {
                checkWinner(isUserAttack)
            } else if computerPick == Hand.rock {
                isUserAttack = false
                playRSPGame(userPick: userPick, computerPick: computerPick)
            } else {
                isUserAttack = true
            }
        case Hand.rock:
            if computerPick == Hand.rock {
                checkWinner(isUserAttack)
            } else if computerPick == Hand.paper {
                isUserAttack = false
                playRSPGame(userPick: userPick, computerPick: computerPick)
            } else {
                isUserAttack = true
            }
        case Hand.paper:
            if computerPick == Hand.paper {
                checkWinner(isUserAttack)
            } else if computerPick == Hand.scissor {
                isUserAttack = false
                playRSPGame(userPick: userPick, computerPick: computerPick)
            } else {
                isUserAttack = true
            }
        default:
            break
        }
    }
    
    func checkWinner(_ isUserAttack: Bool) {
        winner = isUserAttack ? "사용자" : "컴퓨터"
    }
    
    func isUserWin() -> Bool {
        return userWins >= 3
    }
    
    func isComputerWin() -> Bool {
        return computerWins >= 3
    }
    
    func resetUserWinsCount() {
        if userWins >= 3 {
            userWins = 0
        }
    }
    
    func resetComputerWinsCount() {
        if computerWins >= 3 {
            computerWins = 0
        }
    }
    
    func test_사용자가_승리한_경우() {
        playRSPGame(userPick: Hand.scissor, computerPick: Hand.paper)
        XCTAssertEqual(userWins, 1)
        playRSPGame(userPick: Hand.rock, computerPick: Hand.scissor)
        XCTAssertEqual(userWins, 2)
        playRSPGame(userPick: Hand.paper, computerPick: Hand.rock)
        XCTAssertEqual(userWins, 3)
    }
    
    func test_컴퓨터가_승리한_경우() {
        playRSPGame(userPick: Hand.scissor, computerPick: Hand.rock)
        XCTAssertEqual(computerWins, 1)
        playRSPGame(userPick: Hand.rock, computerPick: Hand.paper)
        XCTAssertEqual(computerWins, 2)
        playRSPGame(userPick: Hand.paper, computerPick: Hand.scissor)
        XCTAssertEqual(computerWins, 3)
    }
    
    func test_사용자가_삼세판을_이기면_승리하는_기능() {
        playRSPGame(userPick: Hand.scissor, computerPick: Hand.paper)
        playRSPGame(userPick: Hand.rock, computerPick: Hand.scissor)
        playRSPGame(userPick: Hand.paper, computerPick: Hand.rock)
        XCTAssert(isUserWin())
    }
    
    func test_컴퓨터가_삼세판을_이기면_승리하는_기능() {
        playRSPGame(userPick: Hand.scissor, computerPick: Hand.rock)
        playRSPGame(userPick: Hand.rock, computerPick: Hand.paper)
        playRSPGame(userPick: Hand.paper, computerPick: Hand.scissor)
        XCTAssert(isComputerWin())
    }
    
    func test_삼세판이_끝나고_사용자가_승리하고_초기화하는_기능() {
        playRSPGame(userPick: Hand.scissor, computerPick: Hand.paper)
        playRSPGame(userPick: Hand.rock, computerPick: Hand.scissor)
        playRSPGame(userPick: Hand.paper, computerPick: Hand.rock)
        resetUserWinsCount()
        XCTAssertEqual(userWins, 0)
    }
    
    func test_삼세판이_끝나고_컴퓨터가_승리하고_초기화하는_기능() {
        playRSPGame(userPick: Hand.scissor, computerPick: Hand.rock)
        playRSPGame(userPick: Hand.rock, computerPick: Hand.paper)
        playRSPGame(userPick: Hand.paper, computerPick: Hand.scissor)
        resetComputerWinsCount()
        XCTAssertEqual(computerWins, 0)
    }
    
    // MARK: - STEP 2. 묵찌빠 게임
    func test_가위바위보_게임이_무승부일_경우() {
        playRSPGame(userPick: Hand.rock, computerPick: Hand.rock)
        XCTAssertEqual(isDraw, true)
    }
    
    func test_가위바위보_게임의_선공권이_사용자이고_사용자가_묵찌빠_게임을_이긴경우() {
        playRSPGame(userPick: Hand.rock, computerPick: Hand.scissor)
        playMJBGame(userPick: Hand.paper, computerPick: Hand.paper)
        XCTAssertEqual(winner, "사용자")
    }
    
    func test_가위바위보_게임의_선공권이_컴퓨터이고_컴퓨터가_묵찌빠_게임을_이긴경우() {
        playRSPGame(userPick: Hand.rock, computerPick: Hand.paper)
        playMJBGame(userPick: Hand.scissor, computerPick: Hand.scissor)
        XCTAssertEqual(winner, "컴퓨터")
    }
}
