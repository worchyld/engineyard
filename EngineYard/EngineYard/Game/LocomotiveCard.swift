//
//  LocomotiveCard.swift
//  EngineYard
//
//  Created by Amarjit on 04/07/2024.
//

import Foundation

typealias Card = LocomotiveCard

class LocomotiveCard: Identifiable {
    let id: UUID
    let loco: Locomotive
    var production: Int
    var spentProduction: Int
    
    init(id: UUID = UUID(), loco: Locomotive, production: Int = 0, spentProduction: Int = 0) {
        self.id = id
        self.loco = loco
        self.production = production
        self.spentProduction = spentProduction
    }
}

extension LocomotiveCard {
    func addProduction(units: Int = 0) {
        guard units > 0 else {
            return
        }
        production += units
    }
    
    func spendProduction(units: Int = 0) {
        guard units > 0 else {
            return
        }
        guard production >= units else {
            return
        }
        spentProduction += units
        self.production -= units
    }
    
    func resetProduction() {
        self.production = self.spentProduction
        self.spentProduction = 0
    }
}
