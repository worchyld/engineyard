//
//  BankTests.swift
//  EngineYardTests
//
//  Created by Amarjit on 02/07/2024.
//

import XCTest

@testable import EngineYard

final class BankTests: XCTestCase {

    func testCreditOK() throws {
        let bank = Bank(_balance: 0)
        let result = bank.credit(100)
        switch result {
        case .success(let amount):
            print (bank.balance)
            print (amount)
            XCTAssertTrue(bank.balance == 100)
        case .failure(let err):
            throw err as Error
        }
    }
    
//    func testCreditShouldFailIfLessThanZero() throws {
//        let bank = Bank(_balance: 0)
//        let result = bank.credit(-100)
//        
//        XCTAssertThrowsError(try bank.credit(-100)) { error in
//            XCTAssertEqual(error as! NumericError, NumericError.mustBePositive)
//        }
//        
//        /*
//        switch result {
//        case .success(let amount):
//            print (bank.balance)
//            print (amount)
//            XCTAssertTrue(bank.balance == 0)
//        case .failure(let err):
//            throw err as Error
//        }*/
//    }
}
