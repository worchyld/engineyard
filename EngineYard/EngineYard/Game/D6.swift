//
//  D6.swift
//  EngineYard
//
//  Created by Amarjit on 02/07/2024.
//

import Foundation
import GameplayKit

struct D6 {
    private static let minValue: Int = 1
    private static let maxValue: Int = 6
    
    public static func isValid(D6: Int) -> Bool {
        let numberRange = minValue...maxValue
        return numberRange.contains(D6)
    }
    
    public static func roll() -> Int {
        if #available(iOS 9, *) {
            let d6 = GKRandomDistribution.d6()
            return (d6.nextInt())
        }
        else {
            return Int.random(in: D6.minValue...D6.maxValue)
        }
    }
}

extension D6 {    
    public static func increment(value: Int, byAmount: Int = 1) -> Int {
        var value = value
        guard ((value + byAmount) <= D6.maxValue) else {
            return value
        }
        value += byAmount
        return value
    }
    
    public static func decrement(value: Int, byAmount: Int = 1) -> Int {
        var value = value
        guard ((value - byAmount) >= D6.minValue) else {
            return value
        }
        value -= byAmount
        return value
    }

    /*
    func isValidDiceNumber(_ number: Int, for dice: GKRandomDistribution) -> Bool {
        return (dice.lowestValue...dice.highestValue).contains(number)
    }

    // Example usage:
    let number = 13
    let d12 = GKRandomDistribution.d12()

    if isValidDiceNumber(number, for: d12) {
        print("\(number) is a valid number for D12")
    } else {
        print("\(number) is not a valid number for D12")
    }*/
}
