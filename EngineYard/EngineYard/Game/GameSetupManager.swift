//
//  GameSetupManager.swift
//  EngineYard
//
//  Created by Amarjit on 04/07/2024.
//

import Foundation

class GameSetupManager {
    var gameModel: GameModel
    
    init(gameModel: GameModel) {
        self.gameModel = gameModel
    }
    
    func setup(for players: [Player]) throws {
        guard Constants.NumberOfPlayers.isValid(players.count) else {
            throw GameErrorDelegate.invalidPlayerCount
        }
        
        let gameBoard = GameBoard.init()
        gameBoard.prepare()
        
        switch players.count {
        case 3,4:
            // setup 3-4 player game
            do {
                try self.setupThreeOrFourPlayerGame(board: gameBoard, players: players)
            } catch let err {
                throw err
            }
        case 5:
            // setup 5 player game
            do {
                try self.setupFivePlayerGame(board: gameBoard, players: players)
            } catch let err {
                throw err
            }
        default:
            throw GameErrorDelegate.invalidPlayerCount
        }
    }
    
    // In a 3-4 player game, give each player 12 coins
    // Give each player 1x First Gen Green card, and add 1 production unit to each one
    // Add 3 orders to the first train, Add 1 order to the second train
    private func setupThreeOrFourPlayerGame(board: GameBoard, players: [Player]) throws {
        guard let firstDeck = board.decks.first else {
            throw GameErrorDelegate.invalidBoardData
        }
        guard !firstDeck.cards.isEmpty else {
            throw GameErrorDelegate.invalidBoardData
        }
                
        // Set seedCash of $12
        let cash = Constants.NumberOfPlayers.seedCash(players: 3)
        
        let _ = players.map {
            $0.cash = cash
        }
        
        // In a 3-player game, remove the last card of the first deck; its not used.
        if (players.count == 3) {
            let _ = firstDeck.cards.popLast()
        }
        
        // Give 1x card to each player
        
        // Set 3 orders to first deck
        
        // Set 1 order to second deck
    }
    
    // In a 5 player game, give each player 14 coins
       // No-one has any cards
       // Add 1 order to the first train
    private func setupFivePlayerGame(board: GameBoard, players: [Player]) throws {
        guard let firstDeck = board.decks.first else {
            throw GameErrorDelegate.noBoardDefined
        }
        
        // Set seedCash of $14
        let cash = Constants.NumberOfPlayers.seedCash(players: 5)
        
        let _ = players.map {
            $0.cash = cash
        }
        
        // Add order to first deck
        firstDeck.initialOrder = OrderManager.setInitialOrder()        
    }
}
