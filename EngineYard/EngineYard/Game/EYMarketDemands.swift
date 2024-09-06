// Cursor enabled

import GameplayKit

struct MarketDemands {
    let gameBoard: GameBoard
    let bank: Bank
    var deck: [Locomotive]
    
    mutating func processMarketDemands() {
        for color in LocomotiveColor.allCases {
            let generations = getExistingGenerations(for: color)
            
            switch generations.count {
            case 0:
                handleZeroGenerations(color: color)
            case 1:
                handleOneGeneration(color: color, generation: generations[0])
            case 2:
                handleTwoGenerations(color: color, generations: generations)
            case 3:
                handleThreeGenerations(color: color, generations: generations)
            default:
                break // This shouldn't happen, but we'll leave it here for safety
            }
        }
        
        print("Market demands complete")
    }
    
    private func getExistingGenerations(for color: EngineColor) -> [Generation] {
        return gameBoard.spaces
            .filter { $0.locomotive.color == color }
            .map { $0.locomotive.generation }
            .sorted()
    }
    
    private mutating func handleZeroGenerations(color: EngineColor) {
        if let newLocomotive = deck.first(where: { $0.color == color }) {
            deck.removeAll { $0.color == color && $0.generation == newLocomotive.generation }
            gameBoard.addLocomotive(newLocomotive)
        }
    }
    
    private mutating func handleOneGeneration(color: EngineColor, generation: Generation) {
        let dice = GKRandomDistribution.d6()
        let roll = dice.nextInt()
        
        if roll <= 3 {
            if let newLocomotive = deck.first(where: { $0.color == color && $0.generation.rawValue > generation.rawValue }) {
                deck.removeAll { $0.color == color && $0.generation == newLocomotive.generation }
                gameBoard.addLocomotive(newLocomotive)
            }
        }
    }
    
    private mutating func handleTwoGenerations(color: EngineColor, generations: [Generation]) {
        let dice = GKRandomDistribution.d6()
        let roll = dice.nextInt()
        
        if roll <= 2 {
            gameBoard.removeLowestGeneration(color: color)
        } else if roll >= 5 {
            if let newLocomotive = deck.first(where: { $0.color == color && $0.generation.rawValue > generations.last!.rawValue }) {
                deck.removeAll { $0.color == color && $0.generation == newLocomotive.generation }
                gameBoard.addLocomotive(newLocomotive)
            }
        }
    }
    
    private mutating func handleThreeGenerations(color: EngineColor, generations: [Generation]) {
        let dice = GKRandomDistribution.d6()
        let roll = dice.nextInt()
        
        if roll <= 4 {
            gameBoard.removeLowestGeneration(color: color)
        } else {
            gameBoard.removeLowestGeneration(color: color)
            if let newLocomotive = deck.first(where: { $0.color == color && $0.generation.rawValue > generations.last!.rawValue }) {
                deck.removeAll { $0.color == color && $0.generation == newLocomotive.generation }
                gameBoard.addLocomotive(newLocomotive)
            }
        }
    }
}

// Extensions to support the MarketDemands struct
extension GameBoard {
    mutating func addLocomotive(_ locomotive: Locomotive) {
        spaces.append(LocomotiveSpace(locomotive: locomotive, cards: 4))
    }
    
    mutating func removeLowestGeneration(color: EngineColorc) {
        if let lowestIndex = spaces.enumerated()
            .filter({ $0.element.locomotive.color == color })
            .min(by: { $0.element.locomotive.generation.rawValue < $1.element.locomotive.generation.rawValue })?
            .offset {
            spaces.remove(at: lowestIndex)
        }
    }
}
