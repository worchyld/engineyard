//
//  Card.swift
//  EngineYard
//
//  Created by Amarjit on 04/07/2024.
//

import Foundation
class Card: Identifiable {
    let id: UUID
    let gen: Generation
    let color: EngineColor
    var units: Int
    var spentUnits: Int
    
    init(id: UUID = UUID(), color: EngineColor, gen: Generation, units: Int = 0, spentUnits: Int = 0) {
        self.id = id
        self.color = color
        self.gen = gen
        self.units = units
        self.spentUnits = spentUnits
    }
}
