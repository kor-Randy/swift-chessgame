//
//  Piece.swift
//  ChessGame
//
//  Created by 지현우 on 2022/06/21.
//

import Foundation

final class Pawn: PieceType {
    static let StartPosition: [[String]] = [["A7", "B7", "C7", "D7", "E7", "F7", "G7", "H7"], ["A2", "B2", "C2", "D2", "E2", "F2", "G2", "H2"]]
    var position: Position
    var color: PieceColor
    var pieceString: String {
        if color == .black {
            return "♟"
        } else {
            return  "♙"
        }
    }
    
    var movablePosition: [Position] {
        var positions: [Position] = []
        
        if color == .black, let movablePosition = Position(rank: Character(UnicodeScalar(position.getRankNum() + 1)!), file: position.file) {
            positions.append(movablePosition)
        }
        
        return positions
    }
    
    init(position: Position, color: PieceColor) {
        self.position = position
        self.color = color
    }
    
    func canMove(to position: Position) -> Bool {
        if movablePosition.contains(where: { $0 == position }) {
            return true
        }
        return false
    }
    
    func move(to position: Position) {
        
    }
}

