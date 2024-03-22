//
//  RockPaperScissorsTests.swift
//  RockPaperScissorsTests
//
//  Created by qussk on 3/21/24.
//

import XCTest
@testable import RockPaperScissors

final class RockPaperScissorsTests: XCTestCase {

    var rps: RPS!
    
    override func setUpWithError() throws {
        let genalogy:Genealogy = Genealogy()
        rps = RPS(genealogy: genalogy)
    }

    override func tearDownWithError() throws {
        rps = nil
    }

    

    /*
     양쪽이 낸 패의 승패 판결을 위한 기능을 TDD로 구현합니다
     해당 타입, 메서드를 구현해가며 지속적으로 리팩터링 합니다
     삼세판을 이기면 승리하는 기능을 TDD로 구현합니다
     삼세판이 끝나고 승패가 갈리면 초기화 하는 기능을 TDD로 구현합니다
     성능에 유리한 코드로 작성하도록 노력합니다
     기획의 변경에 대해서 최대한 열린 코드로 작성해봅니다
     */
    
    func test_승패판결_주먹_가위_보가아니면_에러() {
        //given
        let input: [String] = ["🖐️", ""]
        
        //when,then
        XCTAssertThrowsError(try rps.rpsModify(of: input))
    }
    
    func test_승패판결() {
        //given
        let input: [String] = ["🖐️", "✊"] //✊
        
        //when
        let result: [Int] = rps.fightToMatch(of: input)
        
        //then
        XCTAssertEqual(result, [1,0])
        
    }
    
    func test_3회진행() {
        var count = 3
        
        while count == 0 {
            count -= 1
        }
        
    }
    
    
    
    //fileprivate enum의 Hand를 공유해도 되는 건지.
}
