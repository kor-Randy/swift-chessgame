//
//  Piece.swift
//  ChessGame
//
//  Created by 지현우 on 2022/06/20.
//

import Foundation

enum PieceColor: Int {
    case white = 0
    case black = 1
    
    static let colors: [Self] = [.white, .black]
}

protocol PieceType: Movable {
    var position: Position { get set }
    var color: PieceColor { get set }
    var pieceString: String { get }
    
    init(position: Position, color: PieceColor)
}
