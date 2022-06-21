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
        let position = StringConverter.convertToPosition("A2")
        
        XCTAssertNotNil(position)
    }
    
    func testMakePosition_Rank_failure() {
        let position = StringConverter.convertToPosition("Y8")
        
        XCTAssertNil(position)
    }
    
    func testMakePosition_File_failure() {
        let position = StringConverter.convertToPosition("C0")
        
        XCTAssertNil(position)
    }
    
    func testResetPieces_OnlyPawn_success() {
        match.reset()
        let pieces = match.board.pieces
        
        let whitePawnPositions = pieces.filter({ $0.color == .white }).map({ $0.position })
        let blackPawnPositions = pieces.filter({ $0.color == .black }).map({ $0.position })
        
        XCTAssertEqual(pieces.count, 16)
        XCTAssertEqual(whitePawnPositions.count, 8)
        XCTAssertEqual(blackPawnPositions.count, 8)
        
        XCTAssertEqual(whitePawnPositions.map({ "\($0.rank)\($0.file)" }), Pawn.StartPosition[0])
        XCTAssertEqual(blackPawnPositions.map({ "\($0.rank)\($0.file)" }), Pawn.StartPosition[1])
    }

}
