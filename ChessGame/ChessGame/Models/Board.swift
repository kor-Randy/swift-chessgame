//
//  Board.swift
//  Chess
//
//  Created by 지현우 on 2022/06/20.
//

import Foundation

class Board {
    var pieces: [PieceType] = []
    
    func reset() {
        initializePieces()
    }
    
    private func initializePieces() {
        pieces.removeAll(keepingCapacity: true)
        for color in PieceColor.colors {
            for stringPosition in Pawn.StartPosition[color.rawValue] {
                guard let position = StringConverter.convertToPosition(stringPosition) else {
                    return
                }
                pieces.append(Pawn(position: position, color: color))
            }
        }
    }
    
    
}
