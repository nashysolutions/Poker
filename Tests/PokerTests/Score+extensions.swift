import PlayingCards
@testable import Poker

extension Score {
    
    var example: [PlayingCard] {
        switch self {
        case .highCard: return highCardExample
        case .pair: return pairExample
        case .twoPair: return twoPairExample
        case .threeKind: return threeKindExample
        case .straight: return straightExample
        case .fourKind: return fourKindExample
        case .flush: return flushExample
        case .fullHouse: return fullHouseExample
        case .straightFlush: return straightFlushExample
        case .royalFlush: return royalFlushExample
        }
    }
    
    private var highCardExample: [PlayingCard] {
        return [
            HeartCard(rank: .two),
            SpadeCard(rank: .five),
            DiamondCard(rank: .three),
            ClubCard(rank: .nine),
            DiamondCard(rank: .king)
        ]
    }
    
    private var pairExample: [PlayingCard] {
        return [
            HeartCard(rank: .two),
            SpadeCard(rank: .five),
            DiamondCard(rank: .two),
            ClubCard(rank: .nine),
            DiamondCard(rank: .king)
        ]
    }
    
    private var twoPairExample: [PlayingCard] {
        return [
            HeartCard(rank: .two),
            ClubCard(rank: .king),
            DiamondCard(rank: .two),
            ClubCard(rank: .nine),
            DiamondCard(rank: .king)
        ]
    }
    
    private var threeKindExample: [PlayingCard] {
        return [
            HeartCard(rank: .two),
            ClubCard(rank: .king),
            DiamondCard(rank: .two),
            ClubCard(rank: .nine),
            ClubCard(rank: .two)
        ]
    }
    
    private var straightExample: [PlayingCard] {
        return [
            HeartCard(rank: .two),
            ClubCard(rank: .three),
            DiamondCard(rank: .four),
            HeartCard(rank: .six),
            SpadeCard(rank: .five)
        ]
    }
    
    private var fourKindExample: [PlayingCard] {
        return [
            HeartCard(rank: .seven),
            SpadeCard(rank: .queen),
            SpadeCard(rank: .seven),
            DiamondCard(rank: .seven),
            ClubCard(rank: .seven)
        ]
    }
    
    private var flushExample: [PlayingCard] {
        return [
            HeartCard(rank: .two),
            HeartCard(rank: .nine),
            HeartCard(rank: .jack),
            HeartCard(rank: .six),
            HeartCard(rank: .seven)
        ]
    }
    
    private var fullHouseExample: [PlayingCard] {
        return [
            HeartCard(rank: .two),
            HeartCard(rank: .nine),
            SpadeCard(rank: .two),
            SpadeCard(rank: .nine),
            DiamondCard(rank: .nine)
        ]
    }
    
    private var straightFlushExample: [PlayingCard] {
        return [
            HeartCard(rank: .three),
            HeartCard(rank: .six),
            HeartCard(rank: .two),
            HeartCard(rank: .four),
            HeartCard(rank: .five)
        ]
    }
    
    private var royalFlushExample: [PlayingCard] {
        return [
            HeartCard(rank: .ten),
            HeartCard(rank: .jack),
            HeartCard(rank: .queen),
            HeartCard(rank: .king),
            HeartCard(rank: .ace)
        ]
    }
}
