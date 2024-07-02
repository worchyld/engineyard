//
//  Locomotive.swift
//  EngineYard
//
//  Created by Amarjit on 02/07/2024.
//

import Foundation

final class Locomotive: Identifiable {
    let id: UUID
    let name: String
    let generation: Generation
    let engineColor: EngineColor
    let cost: Int
    var productionCost: Int {
        get {
            return Int(round(Double(self.cost) / 2))
        }
    }
    var income: Int {
        get {
            return Int(round(Double(self.productionCost) / 2))
        }
    }
    var initialOrder: Int?
    var orders: [Int]
    var sales: [Int]
    let capacity: Int
    let isActive: Bool
    
    init(id: UUID = UUID(), name: String, generation: Generation, engineColor: EngineColor, cost: Int, initialOrder: Int? = nil, orders: [Int] = [Int](), sales: [Int] = [Int](), capacity: Int = 0, isActive: Bool = false ) {
        self.id = id
        self.name = name
        self.generation = generation
        self.engineColor = engineColor
        self.cost = cost
        self.initialOrder = initialOrder
        self.orders = orders
        self.sales = sales
        self.capacity = capacity
        self.isActive = isActive
    }
}

extension Locomotive: CustomDebugStringConvertible {
    var debugDescription: String {
        let initialOrderString = String(describing: self.initialOrder)
        
        return ("\nID: \(id), initialOrder: \(initialOrderString), orders: \(self.orders), sales: \(self.sales))")
    }
}
