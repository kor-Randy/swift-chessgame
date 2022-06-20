//
//  Player.swift
//  Chess
//
//  Created by 지현우 on 2022/06/20.
//

import Foundation

class Player {
    let color: PieceColor
    var score: Int
    
    init(color: PieceColor, score: Int) {
        self.color = color
        self.score = score
    }
    
    func reset() {
        score = 0
    }
}
