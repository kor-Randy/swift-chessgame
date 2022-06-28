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
    
    func testResetPieces_Pawn_success() {
        match.reset()
        let pawns = match.board.pieces
            .compactMap({ key, value in
                value
            })
            .filter({ $0 is Pawn })
            .sorted {
                $0.position.rank < $1.position.rank
            }
        
        let whitePawnPositions = pawns.filter({ $0.color == .white }).map({ $0.position })
        let blackPawnPositions = pawns.filter({ $0.color == .black }).map({ $0.position })
        
        XCTAssertEqual(pawns.count, 16)
        XCTAssertEqual(whitePawnPositions.count, 8)
        XCTAssertEqual(blackPawnPositions.count, 8)
        
        XCTAssertEqual(whitePawnPositions.map({ "\($0.rank)\($0.file)" }), Pawn.StartPosition[PieceColor.white.rawValue])
        XCTAssertEqual(blackPawnPositions.map({ "\($0.rank)\($0.file)" }), Pawn.StartPosition[PieceColor.black.rawValue])
    }
    
    func testResetPieces_Bishop_success() {
        match.reset()
        let bishops = match.board.pieces.compactMap({ key, value in
            value
        }).filter({ $0 is Bishop })
        
        let whiteBishopPosition = bishops.filter({ $0.color == .white }).map({ $0.position }).first
        let blackBishopPosition = bishops.filter({ $0.color == .black }).map({ $0.position }).first
        
        XCTAssertEqual(bishops.count, 4)
        XCTAssertNotNil(whiteBishopPosition)
        XCTAssertNotNil(blackBishopPosition)
        
        XCTAssertTrue(Bishop.StartablePosition[PieceColor.white.rawValue].contains(whiteBishopPosition.map({ "\($0.rank)\($0.file)" })!))
        XCTAssertTrue(Bishop.StartablePosition[PieceColor.black.rawValue].contains(blackBishopPosition.map({ "\($0.rank)\($0.file)" })!))
    }

}
