//
//  TurnOrderManager.swift
//  EngineYard
//
//  Created by Amarjit on 11/09/2024.
//

import Foundation

class TurnOrderManager {
    private var players: [Int]
    private var currentPlayerIndex: Int
    
    init(playerIDs: [Int]) {
        self.players = playerIDs
        self.currentPlayerIndex = 0
    }
    
    var currentPlayerID: Int {
        return players[currentPlayerIndex]
    }
    
    func nextTurn() {
        currentPlayerIndex = (currentPlayerIndex + 1) % players.count
    }
    
    func resetTurns() {
        currentPlayerIndex = 0
    }
    
    func setCurrentPlayer(id: Int) {
        if let index = players.firstIndex(of: id) {
            currentPlayerIndex = index
        }
    }
    
    func numberOfPlayers() -> Int {
        return players.count
    }
    
    func allPlayerIDs() -> [Int] {
        return players
    }
}
