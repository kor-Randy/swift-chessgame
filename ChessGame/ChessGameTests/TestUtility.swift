//
//  TestUtility.swift
//  ChessTests
//
//  Created by 지현우 on 2022/06/20.
//

import Foundation

class TestUtility {
    static func makePosition(_ string: String) -> Position? {
        guard string.count == 2 else {
            return nil
        }
        
        let rank = string[string.startIndex]
        let file = string[string.index(before: string.endIndex)]
        
        if let position = Position(rank: rank, file: file) {
            return position
        }
        return nil
    }
}
