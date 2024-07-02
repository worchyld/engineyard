//
//  Player.swift
//  EngineYard
//
//  Created by Amarjit on 02/07/2024.
//

import Foundation

class Player: Identifiable {
    let id: UUID
    var isAI: Bool
    
    init(id: UUID = UUID(), isAI: Bool = false) {
        self.id = id
        self.isAI = isAI
    }
}
