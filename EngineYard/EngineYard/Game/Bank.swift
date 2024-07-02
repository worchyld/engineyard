//
//  Bank.swift
//  EngineYard
//
//  Created by Amarjit on 02/07/2024.
//

import Foundation

enum NumericError : Error {
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
    enum Transaction {
        case credit(amount: Int)
        case debit(amount: Int)
    }
    
    private var _balance: Int
    public var balance: Int {
        return self._balance
    }
    
    init(_balance: Int) {
        self._balance = _balance
    }
    
    func make(_ t: Transaction) -> Result<Int, NumericError> {
        do {
           let _ = try validate(t: t)
           
           switch t {
           case .credit(let amount):
               credit(amount)
               return .success(balance)
                           
           case .debit(let amount):
               debit(amount)
               return .success(balance)
           }
       }
       catch let err {
           return .failure(err as! NumericError)
       }
    }
    
    private func credit(_ amount: Int = 0){
        self._balance += amount
    }
    private func debit(_ amount: Int = 0) {
        self._balance -= amount
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
            guard self._balance >= amount else {
                throw NumericError.notEnoughFunds(amount: balance)
            }
            let sum = (balance - amount)
            guard sum >= 0 else {
                throw NumericError.notEnoughFunds(amount: balance)
            }
        }
    }
}

extension Bank {
    func payTax() -> Int {
        guard self.balance > 0 else {
            return self.balance
        }
        let sum: Float = Float(self.balance) * Constants.taxRate
        return Int(round(sum))
    }
}
