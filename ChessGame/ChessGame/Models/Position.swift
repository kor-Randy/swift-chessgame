//
//  Position.swift
//  Chess
//
//  Created by 지현우 on 2022/06/20.
//

import Foundation

class Position {
    static let Ranks: [Character] = ["A", "B", "C", "D", "E", "F", "G", "H"]
    static let Files: [Character] = ["1", "2", "3", "4", "5", "6", "7", "8"]
    var rank: Character
    var file: Character
    
    init?(rank: Character, file: Character) {
        if Self.Ranks.contains(rank), Self.Files.contains(file) {
                self.rank = rank
                self.file = file
        } else {
            return nil
        }
    }
    
    func getRankNum() -> Int {
        let byte = rank.asciiValue
        var value: Int = 0
        value = value << 8
        value = value | Int(byte!)
        
        return value
    }
    
    func getFileNum() -> Int {
        let byte = file.asciiValue
        var value: Int = 0
        value = value << 8
        value = value | Int(byte!)
        
        return value
    }
}
