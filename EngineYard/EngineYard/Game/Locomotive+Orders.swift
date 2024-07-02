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

// orders
extension Locomotive {
    func addOrder() {
        guard !isAtCapacity else {
            return
        }
        let order = D6.roll()
        self.orders.append(order)
    }
    
    func transferOrderToSale() {
        guard !isAtCapacity else {
            return
        }
        
        // Find the item, move it to the sales array, then remove from orders array
        //self.loco.sales.append(value)
        //self.loco.orders.remove(at: index)
    }
}

// sales
extension Locomotive {
    func addSale(value: Int) {
        guard !isAtCapacity else {
            return
        }
        self.sales.append(value)
    }
    
    func transferAllSalesToOrders() {
        guard !isAtCapacity else {
            return
        }
        guard sales.count > 0 else {
            return
        }
        
        let _ = sales.enumerated().map { index, value in
            self.addSale(value: value)
        }
        self.sales.removeAll()
    }
}
