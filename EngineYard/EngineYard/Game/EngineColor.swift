//
//  EngineColor.swift
//  EngineYard
//
//  Created by Amarjit on 02/07/2024.
//

import Foundation

// Trains have a colour
enum EngineColor: Int, Codable, CaseIterable, Equatable  {
    case green = 1, red, yellow, blue
    
    static let allCases: AllCases = [
        .green, .red, .yellow, .blue
    ]
}

// Stringify
extension EngineColor: CustomStringConvertible {
    var description: String {
        get {
            switch self {
            case .green: return "green"
            case .red: return "red"
            case .yellow: return "yellow"
            case .blue: return "blue"
            }
        }
    }
}

// Art
extension EngineColor {
    public var icon : String {
        get {
            switch self {
            case .green: return "icon-train-green"
            case .red: return "icon-train-red"
            case .yellow: return "icon-train-yellow"
            case .blue: return "icon-train-blue"
            }
        }
    }
}

// Cards per generation
extension EngineColor {
    func cardCount(gen: Int) -> Int {
        guard gen >= 1 && gen <= 5 else {
            return 0
        }

        let green = [4,4,4,4,4] // 20 green: 4 First Gen, 4 Second Gen, 4 Third Gen, 4 Fourth Gen, 4 Fifth Gen
        let red = [3,3,3,4,0]  // 13 red: 3 First Gen, 3 Second Gen, 3 Third Gen, 4 Fourth Gen
        let yellow = [2,2,3,0,0] // 7 yellow: 2 First Gen, 2 Second Gen, 3 Third Gen
        let blue = [1,2,0,0,0] //  3 blue: 1 First Gen, 2 Second Gen

        switch self {
        case .green:
            return green[gen]
        case .red:
            return red[gen]
        case .yellow:
            return yellow[gen]
        case .blue:
            return blue[gen]
        }
    }
}
