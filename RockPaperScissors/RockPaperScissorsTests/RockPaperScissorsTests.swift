//
//  RockPaperScissorsTests.swift
//  RockPaperScissorsTests
//
//  Created by Kant on 2/8/24.
//

import XCTest
@testable import RockPaperScissors

final class RockPaperScissorsTests: XCTestCase {
    
    private var userWins = 0
    private var computerWins = 0
    
    private func playGame(userPick: String, computerPick: String) {
        if userPick == computerPick { return }
        
        switch userPick {
        case Hand.scissor:
            if computerPick == Hand.paper {
                userWins += 1
            }
        case Hand.rock:
            if computerPick == Hand.scissor {
                userWins += 1
            }
        case Hand.paper:
            if computerPick == Hand.rock {
                userWins += 1
            }
        default:
            break
        }
        
        computerWins += 1
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
        playGame(userPick: Hand.scissor, computerPick: Hand.paper)
        XCTAssertEqual(userWins, 1)
        playGame(userPick: Hand.rock, computerPick: Hand.scissor)
        XCTAssertEqual(userWins, 2)
        playGame(userPick: Hand.paper, computerPick: Hand.rock)
        XCTAssertEqual(userWins, 3)
    }
    
    func test_컴퓨터가_승리한_경우() {
        playGame(userPick: Hand.scissor, computerPick: Hand.rock)
        XCTAssertEqual(computerWins, 1)
        playGame(userPick: Hand.rock, computerPick: Hand.paper)
        XCTAssertEqual(computerWins, 2)
        playGame(userPick: Hand.paper, computerPick: Hand.scissor)
        XCTAssertEqual(computerWins, 3)
    }
    
    func test_사용자가_삼세판을_이기면_승리하는_기능() {
        playGame(userPick: Hand.scissor, computerPick: Hand.paper)
        playGame(userPick: Hand.rock, computerPick: Hand.scissor)
        playGame(userPick: Hand.paper, computerPick: Hand.rock)
        XCTAssert(isUserWin())
    }
    
    func test_컴퓨터가_삼세판을_이기면_승리하는_기능() {
        playGame(userPick: Hand.scissor, computerPick: Hand.rock)
        playGame(userPick: Hand.rock, computerPick: Hand.paper)
        playGame(userPick: Hand.paper, computerPick: Hand.scissor)
        XCTAssert(isComputerWin())
    }
    
    func test_삼세판이_끝나고_사용자가_승리하고_초기화하는_기능() {
        playGame(userPick: Hand.scissor, computerPick: Hand.paper)
        playGame(userPick: Hand.rock, computerPick: Hand.scissor)
        playGame(userPick: Hand.paper, computerPick: Hand.rock)
        resetUserWinsCount()
        XCTAssertEqual(userWins, 0)
    }
    
    func test_삼세판이_끝나고_컴퓨터가_승리하고_초기화하는_기능() {
        playGame(userPick: Hand.scissor, computerPick: Hand.rock)
        playGame(userPick: Hand.rock, computerPick: Hand.paper)
        playGame(userPick: Hand.paper, computerPick: Hand.scissor)
        resetComputerWinsCount()
        XCTAssertEqual(computerWins, 0)
    }
}
