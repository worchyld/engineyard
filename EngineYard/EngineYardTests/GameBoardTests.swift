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

    func testPrepareBoard() throws {
        XCTAssertNotNil(board, "Board is nil")
    }

}
