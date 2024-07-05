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
    public private (set) var gameState: GameState
    public private (set) var gameBoard: GameBoard
    public private (set) var gameSetting: GameSetting
    public private (set) var players: [Player]
    public private (set) var activePlayer: Player?
    
    init(gameState: GameState = .setup, gameBoard: GameBoard, gameSetting: GameSetting, players: [Player] = [Player](), activePlayer: Player? = nil) {
        self.gameState = gameState
        self.gameBoard = gameBoard
        self.gameSetting = gameSetting
        self.players = players
        self.activePlayer = activePlayer
    }
    
    func setGameState(gameState: GameState) {
        self.gameState = gameState
    }
    
    func setGameBoard(gameBoard: GameBoard) {
        self.gameBoard = gameBoard
    }
    
    func setPlayers(players: [Player]) {
        self.players = players
    }
    
    func setSettings(setting: GameSetting) {
        self.gameSetting = setting
    }
}
