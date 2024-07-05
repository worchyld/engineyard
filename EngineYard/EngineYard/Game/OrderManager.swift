//
//  OrderManager.swift
//  EngineYard
//
//  Created by Amarjit on 04/07/2024.
//

import Foundation

class OrderManager {
    private static func makeRandomOrder() -> Int {
        return D6.roll()
    }
    
    public static func setInitialOrder() -> Int {
        return OrderManager.makeRandomOrder()
    }
    
    func addOrder(value: Int? = nil) -> Int {
        if let value = value {
            guard (value >= 1 && value <= 6) else {
                return -1
            }
        }
        return OrderManager.makeRandomOrder()
    }
}
