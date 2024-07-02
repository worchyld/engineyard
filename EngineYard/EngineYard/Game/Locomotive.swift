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
    
    
    init(id: UUID = UUID(), name: String, generation: Generation, engineColor: EngineColor, cost: Int) {
        self.id = id
        self.name = name
        self.generation = generation
        self.engineColor = engineColor
        self.cost = cost
    }
}
