//
//  GameModel.swift
//  EngineYard
//
//  Created by Amarjit on 02/07/2024.
//

import Foundation

class GameModel {
    var gameBoard: GameBoard
    var gameSetting: GameSetting
    var players: [Player]
    var activePlayer: Player?
    
    init(gameBoard: GameBoard, gameSetting: GameSetting, players: [Player], activePlayer: Player? = nil) {
        self.gameBoard = gameBoard
        self.gameSetting = gameSetting
        self.players = players
        self.activePlayer = activePlayer
    }
}
