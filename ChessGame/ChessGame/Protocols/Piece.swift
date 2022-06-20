//
//  Piece.swift
//  ChessGame
//
//  Created by 지현우 on 2022/06/20.
//

import Foundation

enum PieceColor {
    case white
    case black
}

enum PieceType {
    
}

protocol Piece: Movable {
    var position: Position { get set }
    var color: PieceColor { get set }
}
