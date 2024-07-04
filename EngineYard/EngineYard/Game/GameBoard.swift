//
//  GameBoard.swift
//  EngineYard
//
//  Created by Amarjit on 02/07/2024.
//

import Foundation

class GameBoard {
}

extension GameBoard {
    
    
    private class BoardSpace: Identifiable {
        let id: Int
        let color: EngineColor
        let capacity: Int
        var cards: [Locomotive] = [Locomotive]()
        
        init(id: Int, color: EngineColor, capacity: Int, cards: [Locomotive] = [Locomotive]()) {
            self.id = id
            self.color = color
            self.capacity = capacity
            self.cards = cards
        }
    }
    
    private func createBoard() {

        
        var board = [
            BoardSpace.init(id: 1, color: .green, capacity: 3),
            BoardSpace.init(id: 2, color: .red, capacity: 3),
            BoardSpace.init(id: 3, color: .yellow, capacity: 2),
            BoardSpace.init(id: 4, color: .blue, capacity: 1),
            BoardSpace.init(id: 5, color: .green, capacity: 4),
            BoardSpace.init(id: 6, color: .red, capacity: 3),
            BoardSpace.init(id: 7, color: .yellow, capacity: 3),
            BoardSpace.init(id: 8, color: .green, capacity: 4),
            BoardSpace.init(id: 9, color: .blue, capacity: 2),
            BoardSpace.init(id: 10, color: .red, capacity: 4),
            BoardSpace.init(id: 11, color: .green, capacity: 5),
            BoardSpace.init(id: 12, color: .yellow, capacity: 3),
            BoardSpace.init(id: 13, color: .red, capacity: 4),
            BoardSpace.init(id: 14, color: .green, capacity: 5)
        ]
        
        for item in board {
            
        }
    }
}
