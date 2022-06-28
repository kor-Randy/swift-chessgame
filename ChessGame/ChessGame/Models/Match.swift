//
//  Match.swift
//  Chess
//
//  Created by 지현우 on 2022/06/20.
//

import Foundation

class Match {
    let board: Board = Board()
    let players: [Player] = [Player](arrayLiteral: Player(color: .white), Player(color: .black))
    
    func reset() {
        board.reset()
    }
    
    func printBoard() {
        for file in Position.Files {
            var rowString = ""
            for rank in Position.Ranks {
                if let position = Position(rank: rank, file: file) {
                    if let piece = board.pieces[position] {
                        rowString.append(piece.pieceString)
                    } else {
                        rowString.append(".")
                    }
                    
                }
            }
            print(rowString)
        }
    }
}
