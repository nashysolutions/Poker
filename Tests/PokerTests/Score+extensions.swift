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
            PlayingCard(rank: .two, suit: .hearts),
            PlayingCard(rank: .five, suit: .spades),
            PlayingCard(rank: .three, suit: .diamonds),
            PlayingCard(rank: .nine, suit: .clubs),
            PlayingCard(rank: .king, suit: .diamonds)
        ]
    }
    
    private var pairExample: [PlayingCard] {
        return [
            PlayingCard(rank: .two, suit: .hearts),
            PlayingCard(rank: .five, suit: .spades),
            PlayingCard(rank: .two, suit: .diamonds),
            PlayingCard(rank: .nine, suit: .clubs),
            PlayingCard(rank: .king, suit: .diamonds)
        ]
    }
    
    private var twoPairExample: [PlayingCard] {
        return [
            PlayingCard(rank: .two, suit: .hearts),
            PlayingCard(rank: .king, suit: .clubs),
            PlayingCard(rank: .two, suit: .diamonds),
            PlayingCard(rank: .nine, suit: .clubs),
            PlayingCard(rank: .king, suit: .diamonds)
        ]
    }
    
    private var threeKindExample: [PlayingCard] {
        return [
            PlayingCard(rank: .two, suit: .hearts),
            PlayingCard(rank: .king, suit: .clubs),
            PlayingCard(rank: .two, suit: .diamonds),
            PlayingCard(rank: .nine, suit: .clubs),
            PlayingCard(rank: .two, suit: .clubs)
        ]
    }
    
    private var straightExample: [PlayingCard] {
        return [
            PlayingCard(rank: .two, suit: .hearts),
            PlayingCard(rank: .three, suit: .spades),
            PlayingCard(rank: .four, suit: .diamonds),
            PlayingCard(rank: .six, suit: .hearts),
            PlayingCard(rank: .five, suit: .spades)
        ]
    }
    
    private var fourKindExample: [PlayingCard] {
        return [
            PlayingCard(rank: .seven, suit: .hearts),
            PlayingCard(rank: .queen, suit: .spades),
            PlayingCard(rank: .seven, suit: .spades),
            PlayingCard(rank: .seven, suit: .diamonds),
            PlayingCard(rank: .seven, suit: .clubs)
        ]
    }
    
    private var flushExample: [PlayingCard] {
        return [
            PlayingCard(rank: .two, suit: .hearts),
            PlayingCard(rank: .nine, suit: .hearts),
            PlayingCard(rank: .jack, suit: .hearts),
            PlayingCard(rank: .six, suit: .hearts),
            PlayingCard(rank: .seven, suit: .hearts)
        ]
    }
    
    private var fullHouseExample: [PlayingCard] {
        return [
            PlayingCard(rank: .two, suit: .hearts),
            PlayingCard(rank: .nine, suit: .hearts),
            PlayingCard(rank: .two, suit: .spades),
            PlayingCard(rank: .nine, suit: .spades),
            PlayingCard(rank: .nine, suit: .diamonds)
        ]
    }
    
    private var straightFlushExample: [PlayingCard] {
        return [
            PlayingCard(rank: .three, suit: .hearts),
            PlayingCard(rank: .six, suit: .hearts),
            PlayingCard(rank: .two, suit: .hearts),
            PlayingCard(rank: .four, suit: .hearts),
            PlayingCard(rank: .five, suit: .hearts)
        ]
    }
    
    private var royalFlushExample: [PlayingCard] {
        return [
            PlayingCard(rank: .ten, suit: .hearts),
            PlayingCard(rank: .jack, suit: .hearts),
            PlayingCard(rank: .queen, suit: .hearts),
            PlayingCard(rank: .king, suit: .hearts),
            PlayingCard(rank: .ace, suit: .hearts)
        ]
    }
}
