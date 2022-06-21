//
//  ViewController.swift
//  ChessGame
//
//  Created by 지현우 on 2022/06/20.
//

import UIKit

class ViewController: UIViewController {

    let match = Match()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        match.reset()
        match.printBoard()
    }

}

