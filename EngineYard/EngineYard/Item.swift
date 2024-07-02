//
//  Item.swift
//  EngineYard
//
//  Created by Amarjit on 02/07/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
