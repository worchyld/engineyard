//
//  GameBoardTests.swift
//  EngineYardTests
//
//  Created by Amarjit on 04/07/2024.
//

import XCTest

@testable import EngineYard

final class GameBoardTests: XCTestCase {
    
    var board: GameBoard = GameBoard.init()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        board.prepare()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDecksCount() throws {
        XCTAssertNotNil(board, "Board is nil")
        
        guard let decks = board.decks else {
            XCTAssertThrowsError("Decks is nil")
            return
        }
        let expected = Constants.Board.totalDecks
        XCTAssertEqual(decks.count, expected, "Deck count mis-match \(decks.count), \(expected)")
    }
    
    func testCardCount() throws {
        XCTAssertNotNil(board, "Board is nil")
        
        guard let decks = board.decks else {
            XCTAssertThrowsError("Decks is nil")
            return
        }
        let expected = Constants.Board.totalCards
                
        var total = 0
        for deck in decks {
            total += deck.cards.count
        }
        XCTAssertEqual(total, expected, "Total cards mis-match \(total), \(expected)")
    }

    func testDiceCapacity() throws {
        XCTAssertNotNil(board, "Board is nil")
        
        guard let decks = board.decks else {
            XCTAssertThrowsError("Decks is nil")
            return
        }
        
        var total = 0
        let _ = decks.map({ deck in
            total += deck.diceCapacity
        })
        let expected = Constants.Board.totalDicePoolCapacity
        XCTAssertEqual(total, expected, "Total capacity mis-match: \(total) vs \(expected)")
    }
    
    
    func testGenerationsPerColor() throws {
        XCTAssertNotNil(board, "Board is nil")
        
        guard let decks = board.decks else {
            XCTAssertThrowsError("Decks is nil")
            return
        }
        
        var green = 0
        var red = 0
        var blue = 0
        var yellow = 0
        for deck in decks {
            switch deck.color {
            case .green: green += (deck.cards.count)
            case .red: red += (deck.cards.count)
            case .yellow: yellow += (deck.cards.count)
            case .blue: blue += (deck.cards.count)
            }
        }
        
        XCTAssertEqual(Constants.Cards.green.reduce(0, +), green)
        XCTAssertEqual(Constants.Cards.red.reduce(0, +) , red)
        XCTAssertEqual(Constants.Cards.blue.reduce(0, +) , blue)
        XCTAssertEqual(Constants.Cards.yellow.reduce(0, +), yellow)
    }
    
}
