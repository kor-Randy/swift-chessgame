//
//  ViewController.swift
//  ChessGame
//
//  Created by 지현우 on 2022/06/20.
//

import UIKit

class ViewController: UIViewController {

    let match = Match()
    lazy var rankStackView = RankStackView()
    var touchButtonPositions: [Position?] = Array(repeating: nil, count: 2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        touchButtonPositions.removeAll()
        setupView()
        initButtons()
        initPieces()
    }
    
    private func setupView() {
        view.addSubview(rankStackView)
        NSLayoutConstraint.activate([
            rankStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rankStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rankStackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            rankStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
    }
    
    private func initButtons() {
        for rank in Position.Ranks {
            for file in Position.Files {
                let positionString = "\(rank)\(file)"
                guard let position = StringConverter.convertToPosition(positionString) else {
                    return
                }
                
                // 현재 View 계층 구조가 RankStackView(BoardView 역할) > FileStackView > PositionButton 으로 이루어져있는데
                // 버튼에 액션을 부여하기 위해서 BoardView를 통해 해당 Position의 버튼을 가져와 액션을 주입합니다.
                // 동작에 대한 코드는 VC에 있는 것이 맞다고 생각하였지만
                // 이렇게 상위 뷰에서 하위 뷰의 컴포넌트를 가져와도 되는건지 궁금합니다.
                rankStackView.getButtonAt(position).touchUpAction = { [weak self] position, piece in
                    guard let self = self else {
                        return
                    }
                    
                    switch self.touchButtonPositions.count {
                    case 0:
                        guard let piece = piece else {
                            print("해당 공간에 기물이 없습니다.")
                            return
                        }
                        print("\(position.toString) 위치의 \(piece.pieceString) 를 선택하였습니다.")
                        self.touchButtonPositions.append(position)
                    case 1:
                        guard let piecePosition = self.touchButtonPositions[0],
                              let piece = self.match.board.pieces[piecePosition],
                              piece.movablePositions.contains(position) else {
                            print("기물이 이동할 수 없는 위치\(position.toString)입니다.")
                            self.touchButtonPositions.removeAll()
                            return
                        }
                        
                        if let targetPiece = self.match.board.pieces[position] {
                            print("\(position.toString) 위치로 이동하여 \(targetPiece.pieceString)를 잡습니다.")
                        } else {
                            print("\(position.toString) 위치로 이동합니다.")
                        }
                        self.touchButtonPositions.removeAll()
                        
                    case 2:
                        break
                    default:
                        break
                    }
                }
            }
        }
    }
    
    private func initPieces() {
        match.reset()
        for (position, piece) in match.board.pieces {
            let positionButton = rankStackView.getButtonAt(position)
            positionButton.piece = piece
            positionButton.setTitle(piece.pieceString, for: .normal)
        }
    }

}

