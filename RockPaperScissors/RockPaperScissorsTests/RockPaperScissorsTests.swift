//
//  RockPaperScissorsTests.swift
//  RockPaperScissorsTests
//
//  Created by 홍은표 on 3/18/24.
//

import XCTest
@testable import RockPaperScissors

final class RockPaperScissorsTests: XCTestCase {
  
  var sut: RPSGameable?
  
  override func setUpWithError() throws {
    sut = RPSGame(
      user: User(handStrategy: RandomHandStrategy()),
      computer: Computer(handStrategy: RandomHandStrategy())
    )
  }
  
  override func tearDownWithError() throws {
    sut = nil
  }
  
  func test_사용자가_가위를_내고_컴퓨터가_가위를_내면_비긴다() {
    guard let sut else { return XCTAssertNotNil(sut) }
    
    // given
    let user: Hand = .scissor
    let computer: Hand = .scissor
    
    // when
    sut.battle(userHand: user, computerHand: computer)
    
    // then
    XCTAssert(sut.user.score.draws == 1)
  }
  
  func test_사용자가_바위를_내고_컴퓨터가_바위를_내면_비긴다() {
    guard let sut else { return XCTAssertNotNil(sut) }
    
    // given
    let user: Hand = .rock
    let computer: Hand = .rock
    
    // when
    sut.battle(userHand: user, computerHand: computer)
    
    // then
    XCTAssert(sut.user.score.draws == 1)
  }
  
  func test_사용자가_보를_내고_컴퓨터가_보를_내면_비긴다() {
    guard let sut else { return XCTAssertNotNil(sut) }
    
    // given
    let user: Hand = .paper
    let computer: Hand = .paper
    
    // when
    sut.battle(userHand: user, computerHand: computer)
    
    // then
    XCTAssert(sut.user.score.draws == 1)
  }
  
  func test_사용자가_가위를_내고_컴퓨터가_보를_내면_이긴다() {
    guard let sut else { return XCTAssertNotNil(sut) }
    
    // given
    let user: Hand = .scissor
    let computer: Hand = .paper
    
    // when
    sut.battle(userHand: user, computerHand: computer)
    
    // then
    XCTAssert(sut.user.score.wins == 1)
  }
  
  func test_사용자가_바위를_내고_컴퓨터가_가위를_내면_이긴다() {
    guard let sut else { return XCTAssertNotNil(sut) }
    
    // given
    let user: Hand = .rock
    let computer: Hand = .scissor
    
    // when
    sut.battle(userHand: user, computerHand: computer)
    
    // then
    XCTAssert(sut.user.score.wins == 1)
  }

  func test_사용자가_보를_내고_컴퓨터가_바위를_내면_이긴다() {
    guard let sut else { return XCTAssertNotNil(sut) }
    
    // given
    let user: Hand = .paper
    let computer: Hand = .rock
    
    // when
    sut.battle(userHand: user, computerHand: computer)
    
    // then
    XCTAssert(sut.user.score.wins == 1)
  }
  
  func test_사용자가_가위를_내고_컴퓨터가_바위를_내면_진다() {
    guard let sut else { return XCTAssertNotNil(sut) }
    
    // given
    let user: Hand = .scissor
    let computer: Hand = .rock
    
    // when
    sut.battle(userHand: user, computerHand: computer)
    
    // then
    XCTAssert(sut.user.score.losses == 1)
  }

  func test_사용자가_바위를_내고_컴퓨터가_보를_내면_진다() {
    guard let sut else { return XCTAssertNotNil(sut) }
    
    // given
    let user: Hand = .rock
    let computer: Hand = .paper
    
    // when
    sut.battle(userHand: user, computerHand: computer)
    
    // then
    XCTAssert(sut.user.score.losses == 1)
  }
  
  func test_사용자가_보를_내고_컴퓨터가_가위를_내면_진다() {
    guard let sut else { return XCTAssertNotNil(sut) }
    
    // given
    let user: Hand = .paper
    let computer: Hand = .scissor
    
    // when
    sut.battle(userHand: user, computerHand: computer)
    
    // then
    XCTAssert(sut.user.score.losses == 1)
  }
  
  func test_사용자가_삼세판을_이겼을때_승리한다() {
    guard let sut else { return XCTAssertNotNil(sut) }
    
    // given, when
    sut.battle(userHand: .paper, computerHand: .rock)
    sut.battle(userHand: .paper, computerHand: .rock)
    
    // then
    XCTAssert(sut.user.isWinner)
  }
  
  func test_사용자가_삼세판을_졌을때_패배한다() {
    guard let sut else { return XCTAssertNotNil(sut) }
    
    // given, when
    sut.battle(userHand: .scissor, computerHand: .rock)
    sut.battle(userHand: .rock, computerHand: .scissor)
    sut.battle(userHand: .scissor, computerHand: .rock)
    
    // then
    XCTAssert(sut.user.isLoser)
  }
  
  func test_삼세판이_끝나면_승패가_갈리는지() {
    guard let sut else { return XCTAssertNotNil(sut) }
    
    // given, when
    sut.playBestOfThree()
    
    // then
    XCTAssertTrue(sut.user.isWinner || sut.computer.isWinner)
  }
  
  func test_삼세판이_끝나고_승패가_갈리면_초기화() {
    guard let sut else { return XCTAssertNotNil(sut) }
    
    // given, when
    sut.playBestOfThree()
    
    sut.reset()
    
    // then
    XCTAssertNil(sut.user.currentHand)
    XCTAssertNil(sut.computer.currentHand)
    XCTAssertEqual(sut.user.score.wins, 0)
    XCTAssertEqual(sut.user.score.losses, 0)
    XCTAssertEqual(sut.user.score.draws, 0)
    XCTAssertEqual(sut.computer.score.wins, 0)
    XCTAssertEqual(sut.computer.score.losses, 0)
    XCTAssertEqual(sut.computer.score.draws, 0)
  }
}
