//
//  Generation.swift
//  EngineYard
//
//  Created by Amarjit on 02/07/2024.
//

import Foundation

enum Generation: Int, CaseIterable, Equatable, Codable {
    case first = 1, second, third, fourth, fifth
    
    static public var allCases: [Generation] = [
        .first, .second, .third, .fourth, fifth
    ]
}

// Stringify
extension Generation: CustomStringConvertible {
    var description: String {
        get {
            switch self {
            case .first: return "first"
            case .second: return "second"
            case .third: return "third"
            case .fourth: return "fourth"
            case .fifth: return "fifth"
            }
        }
    }
}

// Comparsion
extension Generation {
    static func > (lhs: Generation, rhs: Generation) -> Bool {
        return (lhs.rawValue > rhs.rawValue)
    }
    static func < (lhs: Generation, rhs: Generation) -> Bool {
        return (lhs.rawValue < rhs.rawValue)
    }
    static func == (lhs: Generation, rhs: Generation) -> Bool {
        return (lhs.rawValue == rhs.rawValue)
    }
}
