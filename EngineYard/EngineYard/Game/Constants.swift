//
//  Constants.swift
//  EngineYard
//
//  Created by Amarjit on 02/07/2024.
//

import Foundation


public struct Constants {
    public static let taxRate: Float = 0.10
    public static let endGameTriggerCash = 330 // need >=300 after tax to trigger end of game
    
    public struct NumberOfPlayers {
        public static let min = 3
        public static let max = 5
        
        public static func seedCash(players: Int) -> Int {
            switch players {
            case 3,4: return 12
            case 5: return 14
            default: return 0
            }
        }
        
        public static func isValid(_ playerCount: Int = NumberOfPlayers.min) -> Bool {
            return (playerCount >= NumberOfPlayers.min && playerCount <= NumberOfPlayers.max)
        }
    }
    
    public struct Board {
        public static let totalDecks = 14 // total number of spaces in the game
        public static let totalCards = 43 // total number of cards in the game
        public static let totalDicePoolCapacity = 46 // for dice
    }
    
    public struct Cards {
        public static let green = [4,4,4,4,4] // 20 green: 4 First Gen, 4 Second Gen, 4 Third Gen, 4 Fourth Gen, 4 Fifth Gen
        public static let red = [3,3,3,4,0]  // 13 red: 3 First Gen, 3 Second Gen, 3 Third Gen, 4 Fourth Gen
        public static let yellow = [2,2,3,0,0] // 7 yellow: 2 First Gen, 2 Second Gen, 3 Third Gen
        public static let blue = [1,2,0,0,0] //  3 blue: 1 First Gen, 2 Second Gen
    }
}
