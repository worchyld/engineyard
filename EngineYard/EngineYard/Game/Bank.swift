//
//  Bank.swift
//  EngineYard
//
//  Created by Amarjit on 02/07/2024.
//

import Foundation

enum NumericError : Error, Comparable {
    case mustBePositive
    case notEnoughFunds(amount: Int)
}

extension NumericError : LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .mustBePositive:
            return NSLocalizedString("Must be a positive number", comment: "Numeric error: Must be a positive number")
        case .notEnoughFunds(let amount):
            NSLog("Funds: \(amount)")
            return NSLocalizedString("You do not have enough funds", comment: "Numeric error: Not enough to do action")
        }
    }
}


class Bank {
    private enum Transaction {
        case credit(amount: Int)
        case debit(amount: Int)
    }
    
    private var _balance: Int
    public var balance: Int {
        return self._balance
    }
    
    init(_ amount: Int = 0) {
        var amount = amount
        if amount < 0 { amount = 0 }
        self._balance = amount
    }
    
    func hasFunds(for amount: Int = 0) -> Bool {
        return self.balance >= amount
    }
    
    func credit(_ amount: Int) -> Result<Int, NumericError> {
        do {
            let _ = try validate(t: Transaction.credit(amount: amount))
            self._balance += amount
        }
        catch let err {
            return .failure(err as! NumericError)
        }
        return .success(self.balance)
    }
    
    func debit(_ amount: Int) -> Result<Int, NumericError> {
        do {
            let _ = try validate(t: Transaction.debit(amount: amount))
            self._balance -= amount
        }
        catch let err {
            return .failure(err as! NumericError)
        }
        
        return .success(self.balance)
    }
    
    private func validate(t: Transaction) throws {
        switch t {
        case .credit(let amount):
            guard amount > 0 else {
                throw NumericError.mustBePositive
            }
            break
            
        case .debit(let amount):
            guard amount > 0 else {
                throw NumericError.mustBePositive
            }
            guard self.hasFunds(for: amount) else {
                throw NumericError.notEnoughFunds(amount: balance)
            }
            let sum = (balance - amount)
            guard sum >= 0 else {
                throw NumericError.notEnoughFunds(amount: balance)
            }
        }
    }
    
}

// MARK: Tax functions

extension Bank {
    func payTax() -> Int {
        guard self.balance > 0 else {
            return self.balance
        }
        let taxDue = calculateTax(on: self.balance)
        guard self.hasFunds(for: taxDue) else {
            return self.balance
        }
        let _ = self.debit(taxDue)
        return self.balance
    }
    
    func calculateTax(on amount: Int) -> Int {
        guard self.balance > 0 else {
            return self.balance
        }
        let returnValue = Int(floor(Float(amount) * Constants.taxRate))
        return returnValue
    }
}
