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
    let genealogy:Genealogy = Genealogy()

    override func setUpWithError() throws {
        rps = RPS(genealogy: self.genealogy)
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
        let input: [String] = ["🖐️", "✊"]
        
        //when,then
        XCTAssertThrowsError(try rps.rpsModify(of: input))
    }
    
    func test_승패판결() {
        //given
        let input: [String] = ["🖐️", "✊"] //✊
        var count: [Int] = [0,0] //테스트를 위해 임의로 만듦.
        
        //when
        let result: [Int] = rps.fightToMatch(of: input, count: count)
        
        //then
        XCTAssertEqual(result, [1,0])
        
    }
    
    func test_삼세판_진행() {
        //given
        var input: [Int] = [2,1]
        
        let result: [Bool] = rps.besttwooutOfthree(of: 2, in: input)
                
        //then
        XCTAssertEqual(result, [true, false])
    }
        
    func test_삼세한_르푸() {
        var countting:[Int] = [2,0]
        
        while rps.besttwooutOfthree(of: 3, in: countting)[0] || rps.besttwooutOfthree(of: 3, in: countting)[1] {
            
            countting = rps.fightToMatch(of: ["🖐️", "✊"], count: countting)
       
        }
        let result: [Bool] = rps.besttwooutOfthree(of: 2, in: countting)
        
        //then
        XCTAssertEqual(result, [true, false])
    }
    
    func test_삼세판후_대결결과() {
        var input: [Bool] = [true, false]
        
    }
    
}
