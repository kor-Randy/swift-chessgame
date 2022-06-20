//
//  Board.swift
//  Chess
//
//  Created by 지현우 on 2022/06/20.
//

import Foundation

class Board {
    var positions: [[Position]] = [[]]
    
    func reset() {
        positions.removeAll(keepingCapacity: true)
        for rank in Position.Ranks {
            var row: [Position] = []
            for file in Position.Files {
                if let position = Position(rank: rank, file: file) {
                    row.append(position)
                }
            }
            positions.append(row)
        }
    }
    
}
