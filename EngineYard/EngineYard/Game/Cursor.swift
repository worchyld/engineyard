// Locomotive colors
enum EYLocomotiveColor: Int, CaseIterable {
    case green = 1
    case red
    case yellow
    case blue
}

// Generation types
enum EYGeneration: Int, CaseIterable {
    case first = 1
    case second
    case third
    case fourth
    case fifth
}

struct Locomotive {
    let generation: Generation
    let color: LocomotiveColor
    let cost: Int
    let baseProduction: Int
    let income: Int
    let existingOrders: [Int]
    let initialOrders: Int
    let customerBase: [Int]
    var additionalProduction: Int = 0
    
    var totalProduction: Int {
        return baseProduction + additionalProduction
    }
}

struct EYGameBoard {
    var spaces: [EYLocomotiveSpace]
    
    struct EYLocomotiveSpace {
        let locomotive: EYLocomotive
        var cards: Int
    }
}

class EYPlayer {
    var coins: Int
    var cards: [EYLocomotive]
    var name: String
    
    init(name: String, initialCoins: Int = 10) {
        self.name = name
        self.coins = initialCoins
        self.cards = []
    }
    
    // Existing methods remain unchanged
    
    func purchaseProductionUnit(for card: Locomotive) -> Bool {
        let cost = card.generation.rawValue * 5
        if coins >= cost {
            if let index = cards.firstIndex(where: { $0.color == card.color && $0.generation == card.generation }) {
                coins -= cost
                cards[index].additionalProduction += 1
                return true
            }
        }
        return false
    }
    
    func shiftProductionUnit(from sourceCard: Locomotive, to targetCard: Locomotive) -> Bool {
        guard sourceCard.generation.rawValue < targetCard.generation.rawValue else {
            return false
        }
        
        if let sourceIndex = cards.firstIndex(where: { $0.color == sourceCard.color && $0.generation == sourceCard.generation }),
           let targetIndex = cards.firstIndex(where: { $0.color == targetCard.color && $0.generation == targetCard.generation }) {
            
            if cards[sourceIndex].additionalProduction > 0 {
                let costDifference = (targetCard.generation.rawValue - sourceCard.generation.rawValue) * 5
                
                if coins >= costDifference {
                    coins -= costDifference
                    cards[sourceIndex].additionalProduction -= 1
                    cards[targetIndex].additionalProduction += 1
                    return true
                }
            }
        }
        return false
    }
}

// Initialize the game board
let gameBoard = GameBoard(spaces: [
    GameBoard.LocomotiveSpace(locomotive: EYLocomotive(generation: .first, color: .green, cost: 4, baseProduction: 2, income: 1, existingOrders: [1, 2], initialOrders: 1, customerBase: [1, 2]), cards: 4),
    GameBoard.LocomotiveSpace(locomotive: EYLocomotive(generation: .first, color: .red, cost: 8, baseProduction: 2, income: 2, existingOrders: [1, 2], initialOrders: 1, customerBase: [1, 2]), cards: 3),
    GameBoard.LocomotiveSpace(locomotive: EYLocomotive(generation: .first, color: .yellow, cost: 12, baseProduction: 6, income: 3, existingOrders: [1, 1], initialOrders: 1, customerBase: [1, 1]), cards: 2),
    GameBoard.LocomotiveSpace(locomotive: EYLocomotive(generation: .first, color: .blue, cost: 16, baseProduction: 8, income: 4, existingOrders: [1], initialOrders: 1, customerBase: [1]), cards: 1),
    GameBoard.LocomotiveSpace(locomotive: EYLocomotive(generation: .second, color: .green, cost: 20, baseProduction: 10, income: 5, existingOrders: [1, 2, 3], initialOrders: 1, customerBase: [1, 2, 3]), cards: 4),
    GameBoard.LocomotiveSpace(locomotive: EYLocomotive(generation: .second, color: .red, cost: 24, baseProduction: 12, income: 6, existingOrders: [1, 2], initialOrders: 1, customerBase: [1, 2]), cards: 3),
    GameBoard.LocomotiveSpace(locomotive: EYLocomotive(generation: .second, color: .yellow, cost: 28, baseProduction: 16, income: 7, existingOrders: [1, 2], initialOrders: 1, customerBase: [1, 2]), cards: 2),
    GameBoard.LocomotiveSpace(locomotive: EYLocomotive(generation: .third, color: .green, cost: 32, baseProduction: 16, income: 8, existingOrders: [1, 2, 3], initialOrders: 1, customerBase: [1, 2, 3]), cards: 4),
    GameBoard.LocomotiveSpace(locomotive: EYLocomotive(generation: .second, color: .blue, cost: 36, baseProduction: 18, income: 9, existingOrders: [1, 1], initialOrders: 1, customerBase: [1, 1]), cards: 2),
    GameBoard.LocomotiveSpace(locomotive: EYLocomotive(generation: .third, color: .red, cost: 40, baseProduction: 20, income: 10, existingOrders: [1, 2, 3], initialOrders: 1, customerBase: [1, 2, 3]), cards: 3),
    GameBoard.LocomotiveSpace(locomotive: EYLocomotive(generation: .fourth, color: .green, cost: 44, baseProduction: 22, income: 11, existingOrders: [1, 2, 3, 4], initialOrders: 1, customerBase: [1, 2, 3, 4]), cards: 4),
    GameBoard.LocomotiveSpace(locomotive: EYLocomotive(generation: .third, color: .yellow, cost: 48, baseProduction: 26, income: 12, existingOrders: [1, 2], initialOrders: 1, customerBase: [1, 2]), cards: 3),
    GameBoard.LocomotiveSpace(locomotive: EYLocomotive(generation: .fourth, color: .red, cost: 52, baseProduction: 26, income: 13, existingOrders: [1, 2, 3], initialOrders: 1, customerBase: [1, 2, 3]), cards: 4),
    GameBoard.LocomotiveSpace(locomotive: EYLocomotive(generation: .fifth, color: .green, cost: 56, baseProduction: 28, income: 14, existingOrders: [1, 2, 3, 4], initialOrders: 1, customerBase: [1, 2, 3, 4]), cards: 4)
])

enum GamePhase {
    case setup
    case playerTurn
    case endGame
}

class EYGameState {
    var players: [Player]
    var gameBoard: GameBoard
    var currentPlayerIndex: Int
    var currentPhase: GamePhase
    var roundNumber: Int
    var deck: [EYLocomotive]
    
    init(players: [EYPlayer], gameBoard: GameBoard) {
        self.players = players
        self.gameBoard = gameBoard
        self.currentPlayerIndex = 0
        self.currentPhase = .setup
        self.roundNumber = 1
        self.deck = [] // Initialize with all locomotive cards
    }
    
    var currentPlayer: Player {
        return players[currentPlayerIndex]
    }
    
    func nextTurn() {
        currentPlayerIndex = (currentPlayerIndex + 1) % players.count
        if currentPlayerIndex == 0 {
            roundNumber += 1
        }
    }
    
    func startGame() {
        // Perform any necessary setup
        shuffleDeck()
        dealInitialCards()
        currentPhase = .playerTurn
    }
    
    func shuffleDeck() {
        deck.shuffle()
    }
    
    func dealInitialCards() {
        // Deal initial cards to players
    }
    
    func drawCard() -> Locomotive? {
        return deck.popLast()
    }
    
    func replenishGameBoard() {
        // Logic to refill empty spaces on the game board
    }
    
    func isGameOver() -> Bool {
        // Implement game-over conditions
        return false
    }
    
    func calculateScores() -> [(Player, Int)] {
        // Calculate and return final scores for each player
        return players.map { player in
            let score = calculatePlayerScore(player)
            return (player, score)
        }
    }
    
    private func calculatePlayerScore(_ player: Player) -> Int {
        // Implement scoring logic
        return 0
    }
}


/*

let player = Player(name: "Alice", initialCoins: 50)
let card1 = gameBoard.spaces[0].locomotive
let card2 = gameBoard.spaces[4].locomotive

player.addCard(card1)
player.addCard(card2)

// Purchase a production unit
if player.purchaseProductionUnit(for: card1) {
    print("Production unit purchased for card1")
}

// Shift a production unit
if player.shiftProductionUnit(from: card1, to: card2) {
    print("Production unit shifted from card1 to card2")
}

*/


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

    func getLastFiveEntries() -> [String] {
        let lastFiveEntries = gameLog.getEntries().suffix(5)
        return lastFiveEntries
    }
}