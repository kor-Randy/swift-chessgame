//
//  Board.swift
//  Chess
//
//  Created by 지현우 on 2022/06/20.
//

import Foundation

class Board {
    var pieces: [Position: PieceType] = [:]
    
    func reset() {
        initializePieces()
    }
    
    private func initializePieces() {
        pieces.removeAll()
        for color in PieceColor.colors {
            for stringPosition in Pawn.StartPosition[color.rawValue] {
                guard let position = StringConverter.convertToPosition(stringPosition) else {
                    return
                }
                pieces[position] = Pawn(position: position, color: color)
            }
            
            for stringPosition in Bishop.StartablePosition[color.rawValue] {
                guard let position = StringConverter.convertToPosition(stringPosition) else {
                    return
                }
                pieces[position] = Bishop(position: position, color: color)
            }
        }
    }
    
    
}
