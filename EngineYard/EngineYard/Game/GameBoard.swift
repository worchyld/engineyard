//
//  GameBoard.swift
//  EngineYard
//
//  Created by Amarjit on 02/07/2024.
//

import Foundation

class GameBoard {
    var decks: [Deck]
    
    init(decks: [Deck]) {
        self.decks = decks
    }
}

extension GameBoard {
    private func createBoard() {
        // Cards:
        // 20 green: 4x First Gen, 4x Second Gen, 4x Third Gen, 4x Fourth Gen, 4x Fifth Gen
        // 13 red: 3x First Gen, 3x Second Gen, 3x Third Gen, 4x Fourth Gen
        // 7 yellow: 2x First Gen, 2x Second Gen, 3x Third Gen
        // 3 blue: 1x First Gen, 2x Second Gen
            
        let decks = [
            Deck.init(id: 1, color: .green, gen: .first, qty: 4, capacity: 3, cost: 4),
            Deck.init(id: 2, color: .red, gen: .first, qty: 3, capacity: 3, cost: 8),
            Deck.init(id: 3, color: .yellow, gen: .first, qty: 2, capacity: 2, cost: 12),
            Deck.init(id: 4, color: .blue, gen: .first, qty: 1, capacity: 1, cost: 16),
            Deck.init(id: 5, color: .green, gen: .second, qty: 4, capacity: 4, cost: 20),
            Deck.init(id: 6, color: .red, gen: .second, qty: 3, capacity: 3, cost: 24),
            Deck.init(id: 7, color: .yellow, gen: .second, qty: 2, capacity: 3, cost: 28),
            Deck.init(id: 8, color: .green, gen: .third, qty: 4, capacity: 4, cost: 32),
            Deck.init(id: 9, color: .blue, gen: .second, qty: 2, capacity: 2, cost: 36),
            Deck.init(id: 10, color: .red, gen: .third, qty: 3, capacity: 4, cost: 40),
            Deck.init(id: 11, color: .green, gen: .fourth, qty: 4, capacity: 5, cost: 44),
            Deck.init(id: 12, color: .yellow, gen: .third, qty: 3, capacity: 3, cost: 48),
            Deck.init(id: 13, color: .red, gen: .third, qty: 4, capacity: 4, cost: 52),
            Deck.init(id: 14, color: .green, gen: .fifth, qty: 4, capacity: 5, cost: 56)
        ]
        
        for deck in decks {
            for _ in 1...deck.qty {
                let card = Card.init(color: deck.color, gen: deck.gen)
                deck.cards.append(card)
            }
        }
    }
}
