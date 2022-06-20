//
//  Match.swift
//  Chess
//
//  Created by 지현우 on 2022/06/20.
//

import Foundation

class Match {
    let board: Board = Board()
    let players: [Player] = [Player](arrayLiteral: Player(color: .white, score: 0), Player(color: .black, score: 0))
    
    func reset() {
        board.reset()
        players.forEach {
            $0.reset()
        }
    }
}
