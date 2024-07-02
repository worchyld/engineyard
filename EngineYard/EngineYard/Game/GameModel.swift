//
//  GameModel.swift
//  EngineYard
//
//  Created by Amarjit on 02/07/2024.
//

import Foundation

enum GameState: Int, Codable, CaseIterable, Equatable {
    case setup, mainMenu, soundSelect, playerSelect, buyTrainScreen, buyProductionScreen, sellScreen, marketUpdateScreen, taxScreen, endOfGameScreen
}

public enum GameErrorDelegate: Error {
    case noGameData, noGameObject, noBoardDefined, invalidBoardData, noPlayersFound, invalidPlayerCount
}

class GameModel {
    var gameState: GameState
    var gameBoard: GameBoard
    var gameSetting: GameSetting
    var players: [Player]
    var activePlayer: Player?
    
    init(gameState: GameState = .setup, gameBoard: GameBoard, gameSetting: GameSetting, players: [Player], activePlayer: Player? = nil) {
        self.gameState = gameState
        self.gameBoard = gameBoard
        self.gameSetting = gameSetting
        self.players = players
        self.activePlayer = activePlayer
        
    }
}
