//
//  Position.swift
//  Chess
//
//  Created by 지현우 on 2022/06/20.
//

import Foundation

class Position: Hashable {
    static let Ranks: [Character] = ["A", "B", "C", "D", "E", "F", "G", "H"]
    static let Files: [Character] = ["1", "2", "3", "4", "5", "6", "7", "8"]
    var rank: Character
    var file: Character
    
    var toString: String {
        "\(self.rank)\(self.file)"
    }
    
    init?(rank: Character, file: Character) {
        if Self.Ranks.contains(rank), Self.Files.contains(file) {
                self.rank = rank
                self.file = file
        } else {
            return nil
        }
    }
    
    static func == (lhs: Position, rhs: Position) -> Bool {
        if lhs.rank == rhs.rank, lhs.file == rhs.file {
            return true
        }
        
        return false
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(rank)
        hasher.combine(file)
    }
}

// MARK: Convert Position
extension Position {
    func getRankNum() -> Int {
        let rankAscValue = rank.asciiValue!
        let num = Int(rankAscValue - ("A" as Character).asciiValue!)
        
        return num
    }
    
    func getFileNum() -> Int {
        let fileAscValue = file.asciiValue!
        let num = Int(fileAscValue - ("1" as Character).asciiValue!)
        
        return num
    }
}
