//
//  ChessTests.swift
//  ChessTests
//
//  Created by 지현우 on 2022/06/20.
//

import XCTest
@testable import ChessGame

class ChessTests: XCTestCase {

    var match: Match = Match()
    
    func testMakePosition_success() {
        let position = TestUtility.makePosition("A2")
        
        XCTAssertNotNil(position)
    }
    
    func testMakePosition_Rank_failure() {
        let position = TestUtility.makePosition("Y8")
        
        XCTAssertNil(position)
    }
    
    func testMakePosition_File_failure() {
        let position = TestUtility.makePosition("C0")
        
        XCTAssertNil(position)
    }

}
