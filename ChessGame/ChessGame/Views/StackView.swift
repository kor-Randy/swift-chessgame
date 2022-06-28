//
//  BoardView.swift
//  ChessGame
//
//  Created by 지현우 on 2022/06/27.
//

import UIKit

class RankStackView: UIStackView {
    private var fileStackViews: [FileStackView] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        backgroundColor = .black
        axis = .vertical
        translatesAutoresizingMaskIntoConstraints = false
        distribution = .fillEqually
        spacing = 2
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        for index in 0...7 {
            let fileStackView = FileStackView(rank: Position.Ranks[index])
            self.fileStackViews.append(fileStackView)
            self.addArrangedSubview(fileStackView)
        }
    }
    
    func getButtonAt(_ position: Position) -> PositionButton {
        let rank = position.getRankNum()
        let file = position.getFileNum()
        return fileStackViews[file].positionButtons[rank]
    }
}

class FileStackView: UIStackView {
    var rank: Character
    fileprivate var positionButtons: [PositionButton] = []
    
    init(rank: Character) {
        self.rank = rank
        super.init(frame: .zero)
        backgroundColor = .black
        axis = .horizontal
        translatesAutoresizingMaskIntoConstraints = false
        distribution = .fillEqually
        spacing = 2
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        for index in 0...7 {
            guard let position = Position(rank: self.rank, file: Position.Files[index]) else {
                return
            }
            let button = PositionButton(position: position)
            self.positionButtons.append(button)
            self.addArrangedSubview(button)
        }
    }
    
}
