//
//  Movable.swift
//  ChessGame
//
//  Created by 지현우 on 2022/06/20.
//

import Foundation

protocol Movable {
    var movablePosition: [Position] { get }
    func canMove(to position: Position) -> Bool
    func move(to position: Position)
}
