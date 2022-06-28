//
//  PositionButton.swift
//  ChessGame
//
//  Created by 지현우 on 2022/06/27.
//

import UIKit

class PositionButton: UIButton {
    var position: Position
    var piece: PieceType?
    var touchUpAction: ((Position, PieceType?) -> ())?
    
    init(position: Position, piece: PieceType? = nil) {
        self.position = position
        self.piece = piece
        super.init(frame: .zero)
        backgroundColor = .lightGray
        addTarget(nil, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func didTapButton() {
        touchUpAction?(position, piece)
    }
    
}
