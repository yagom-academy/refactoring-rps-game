//
//  MJBTests.swift
//  MJBTests
//
//  Created by Park Sungmin on 3/20/24.
//

import XCTest

@testable import RockPaperScissors

final class MJBTests: XCTestCase {

    var sut: MJBGameRule?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MJBGameRule(targetScore: 1)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testExample() throws {
        
    }

}
