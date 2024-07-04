//
//  Deck.swift
//  EngineYard
//
//  Created by Amarjit on 04/07/2024.
//

import Foundation

// The game board is made up of 14 decks
// Each deck has a number of cards

class Deck: Identifiable {
    let id: Int
    let color: EngineColor
    let gen: Generation
    let qty: Int
    let diceCapacity: Int
    let cost: Int
    var initialOrder: Int?
    var orders: [Int]
    var sales: [Int]
    var cards: [Card]
    
    init(id: Int, color: EngineColor, gen: Generation, qty: Int, capacity: Int, cost: Int = 0,
         initialOrder: Int? = nil, orders: [Int] = [Int](), sales: [Int] = [Int](), cards: [Card] = [Card]()) {
        self.id = id
        self.color = color
        self.gen = gen
        self.qty = qty
        self.diceCapacity = capacity
        self.cost = cost
        self.initialOrder = initialOrder
        self.orders = orders
        self.sales = sales
        self.cards = cards
    }
}
