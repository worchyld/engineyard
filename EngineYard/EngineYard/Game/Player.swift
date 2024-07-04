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
    var cards: [Card]
    var cash: Int
    
    init(id: UUID = UUID(), isAI: Bool = false, cards: [Card] = [Card](), cash: Int = 0) {
        self.id = id
        self.isAI = isAI
        self.cards = cards
        self.cash = cash
    }
}
