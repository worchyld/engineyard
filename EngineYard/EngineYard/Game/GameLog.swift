//
//  GameLog.swift
//  EngineYard
//
//  Created by Amarjit on 06/09/2024.
//

import Foundation

struct GameLog {
    private var entries: [String] = []
    private let maxEntries: Int
    
    init(maxEntries: Int = 1000) {
        self.maxEntries = maxEntries
    }
    
    mutating func log(_ message: String) {
        let timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .medium)
        let entry = "[\(timestamp)] \(message)"
        
        entries.append(entry)
        
        if entries.count > maxEntries {
            entries.removeFirst()
        }
    }
    
    func getEntries() -> [String] {
        return entries
    }
    
    mutating func clear() {
        entries.removeAll()
    }

//    func getLastFiveEntries() -> [String] {
//        //let lastFiveEntries = gameLog.getEntries().suffix(5)
//        return lastFiveEntries
//    }
}
