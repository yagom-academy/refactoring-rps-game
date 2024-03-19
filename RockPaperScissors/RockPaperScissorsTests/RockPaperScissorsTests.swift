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
    
    override func setUpWithError() throws {
        sut = Game(user: User(), computer: User())
    }
    
    // TestCode 테스팅
    func test_userWin() throws {
        // given
        let userScore = sut?.user.score
        let computerScore = sut?.computer.score
        // when
        sut?.userWin()
        
        // then
        XCTAssertEqual(sut?.user.score, 1)
    }

}
