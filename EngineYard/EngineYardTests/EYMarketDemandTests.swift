import XCTest
import GameplayKit
@testable import EngineYard

class MarketDemandsTests: XCTestCase {

    var gameBoard: GameBoard!
    var bank: Bank!
    var deck: [Locomotive]!
    
    override func setUp() {
        super.setUp()
        gameBoard = GameBoard(spaces: [])
        bank = Bank()
        deck = []
        
        // Seed the game board with 1 generation of green locomotives
        let greenLocomotive = Locomotive(generation: .first, color: .green, cost: 4, baseProduction: 2, income: 1, existingOrders: [1, 2], initialOrders: 1, customerBase: [1, 2])
        gameBoard.addLocomotive(greenLocomotive)
        
        // Add a second generation green locomotive to the deck
        deck.append(Locomotive(generation: .second, color: .green, cost: 20, baseProduction: 10, income: 5, existingOrders: [1, 2, 3], initialOrders: 1, customerBase: [1, 2, 3]))
    }
    
    func testOneGenerationGreenLocomotive() {
        // Log the initial state
        print("Initial Game Board:")
        print(gameBoard)
        
        if let greenLocomotive = gameBoard.spaces.first(where: { $0.locomotive.color == .green }) {
            print("Initial Green Locomotive:")
            print(greenLocomotive.locomotive)
            print("Initial Existing Orders: \(greenLocomotive.locomotive.existingOrders)")
            print("Initial Initial Orders: \(greenLocomotive.locomotive.initialOrders)")
        }
        
        // Create and process market demands
        var marketDemands = MarketDemands(gameBoard: gameBoard, bank: bank, deck: deck)
        marketDemands.processMarketDemands()
        
        // Log the final state
        print("\nFinal Game Board:")
        print(gameBoard)
        
        if let greenLocomotive = gameBoard.spaces.first(where: { $0.locomotive.color == .green }) {
            print("Final Green Locomotive:")
            print(greenLocomotive.locomotive)
            print("Final Existing Orders: \(greenLocomotive.locomotive.existingOrders)")
            print("Final Initial Orders: \(greenLocomotive.locomotive.initialOrders)")
        }
        
        // Assertions
        XCTAssertEqual(gameBoard.spaces.count, 2, "There should be two locomotives on the board")
        
        let greenLocomotives = gameBoard.spaces.filter { $0.locomotive.color == .green }
        XCTAssertEqual(greenLocomotives.count, 2, "There should be two green locomotives")
        
        if let firstGenGreen = greenLocomotives.first(where: { $0.locomotive.generation == .first }) {
            XCTAssertEqual(firstGenGreen.locomotive.existingOrders.count, 3, "First generation green should have 3 existing orders")
            XCTAssertEqual(firstGenGreen.locomotive.initialOrders, 0, "First generation green should have 0 initial orders")
        } else {
            XCTFail("First generation green locomotive not found")
        }
        
        if let secondGenGreen = greenLocomotives.first(where: { $0.locomotive.generation == .second }) {
            XCTAssertEqual(secondGenGreen.locomotive.existingOrders.count, 3, "Second generation green should have 3 existing orders")
            XCTAssertEqual(secondGenGreen.locomotive.initialOrders, 1, "Second generation green should have 1 initial order")
        } else {
            XCTFail("Second generation green locomotive not found")
        }
    }
}