//
//  Movable.swift
//  ChessGame
//
//  Created by 지현우 on 2022/06/20.
//

import Foundation

protocol Movable {
    func canMove(to position: Position)
    func move(to position: Position)
}
