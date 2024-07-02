//
//  Locomotive+Orders.swift
//  EngineYard
//
//  Created by Amarjit on 02/07/2024.
//

import Foundation


// initialOrder
extension Locomotive {
    func createInitialOrder() {
        guard let _ = self.initialOrder else {
            return
        }
        guard ((self.orders.count == 0) && (self.sales.count == 0)) else {
            return
        }
        self.initialOrder = D6.roll()
    }
}
