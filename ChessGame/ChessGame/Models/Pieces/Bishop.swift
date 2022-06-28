//
//  Bishop.swift
//  ChessGame
//
//  Created by 지현우 on 2022/06/21.
//

import Foundation

final class Bishop: PieceType {
    static let StartablePosition: [[String]] = [["C8", "F8"], ["C1", "F1"]]
    var position: Position
    var color: PieceColor
    var pieceString: String {
        if color == .black {
            return "♝"
        } else {
            return  "♗"
        }
    }
    
    var movablePositions: [Position] {
        let positions: [Position] = []
        
        return positions
    }
    
    init(position: Position, color: PieceColor) {
        self.position = position
        self.color = color
    }
    
    func canMove(to position: Position) -> Bool {
        if movablePositions.contains(where: { $0 == position }) {
            return true
        }
        return false
    }
    
    func move(to position: Position) {
        
    }
}
