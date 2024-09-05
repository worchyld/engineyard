struct CustomNumberFormatter {
    static func format(_ number: Int) -> String {
        let absNumber = abs(number)
        let sign = number < 0 ? "-" : ""
        
        switch absNumber {
        case 0..<1_000:
            return "\(number)"
        case 1_000..<1_000_000:
            return "\(sign)\(absNumber / 1_000)K"
        case 1_000_000..<10_000_000:
            return "\(sign)\(Double(absNumber) / 1_000_000)M"
        case 10_000_000..<100_000_000:
            return "\(sign)\(Double(absNumber) / 1_000_000)M"
        case 100_000_000..<1_000_000_000:
            return "\(sign)\(absNumber / 1_000_000)M"
        case 1_000_000_000..<10_000_000_000:
            return "\(sign)\(absNumber / 1_000_000_000)B"
        default:
            return "\(sign)\(absNumber / 1_000_000_000)B"
        }
    }
}

// Example usage:
let numbers = [125000, 120000, 1_000_000, 1_100_000, 1_150_000, 100_000_000, 1_000_000_000, -1_000_000_000, 10_000_000_000]

for number in numbers {
    print(CustomNumberFormatter.format(number))
}