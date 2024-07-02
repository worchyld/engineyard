//
//  GameBoard.swift
//  EngineYard
//
//  Created by Amarjit on 02/07/2024.
//

import Foundation

class GameBoard {
    var spaces: [Space]
    
    init(spaces: [Space]) {
        self.spaces = spaces
    }
}

class Space {
    let locomotive: Locomotive
    var isAvailable: Bool
    
    init(locomotive: Locomotive, isAvailable: Bool = false) {
        self.locomotive = locomotive
        self.isAvailable = isAvailable
    }
}
