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
        let bank = Bank(0)
        let result = bank.credit(100)
        let expected = 100
        
        switch result {
        case .success(let amount):
            print (bank.balance)
            XCTAssertEqual(amount, expected, "Numbers are not equal")
            XCTAssertTrue(bank.balance == 100)
        case .failure(let err):
            throw err as Error
        }
    }
    
    func testDebitOK() throws {
        let bank = Bank(100)
        let result = bank.debit(50)
        let expected = 50
        
        switch result {
        case .success(let amount):
            XCTAssertEqual(bank.balance, expected, "Numbers are not equal")
            XCTAssertEqual(amount, expected)
        case .failure(let err):
            throw err as Error
        }
    }
    
    func testCreditLessthanZero() throws {
        let bank = Bank(0)
        let result = bank.credit(-100)
        
        switch result {
        case .success:
            XCTAssertThrowsError("Credited minus figure: \(bank.balance)")
        case .failure(let err):
            //throw err as Error
            XCTAssertEqual(err, NumericError.mustBePositive, "Not equal")
        }
    }
    
    func testDebitLessThanZero() throws {
        let bank = Bank(0)
        let result = bank.debit(-100)
        
        switch result {
        case .success:
            XCTAssertThrowsError("Debited minus figure: \(bank.balance)")
        case .failure(let err):
            //throw err as Error
            XCTAssertEqual(err, NumericError.mustBePositive, "Not equal")
        }
    }
    
    func testDebitMoreThanBalance() throws {
        let expected = 100
        let bank = Bank(expected)
        let result = bank.debit(500)
        
        switch result {
        case .success:
            XCTAssertThrowsError("Debited more than bank balance: \(bank.balance)")
        case .failure(let err):
            XCTAssertEqual(bank.balance, expected)
            XCTAssertEqual(err, NumericError.notEnoughFunds(amount: expected), "Not equal")
        }
    }
    
//
//        XCTAssertThrowsError(try bank.credit(-100)) { error in
//            XCTAssertEqual(error as! NumericError, NumericError.mustBePositive)
//        }
}
