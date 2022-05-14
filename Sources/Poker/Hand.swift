import PlayingCards

public enum Hand: Comparable, CustomStringConvertible {
    
    case highCard(Rank)
    case pair(Rank)
    case twoPair(Rank)
    case threeKind(Rank)
    case straight(Rank)
    case fourKind(Rank)
    case flush(Rank)
    case fullHouse(Rank)
    case straightFlush(Rank)
    case royalFlush
    
    init?(_ score: Score, _ rank: Rank) {
        switch score {
        case .highCard:
            self = .highCard(rank)
        case .pair:
            self = .pair(rank)
        case .twoPair:
            self = .twoPair(rank)
        case .threeKind:
            self = .threeKind(rank)
        case .straight:
            self = .straight(rank)
        case .fourKind:
            self = .fourKind(rank)
        case .flush:
            self = .flush(rank)
        case .fullHouse:
            self = .fullHouse(rank)
        case .straightFlush:
            self = .straightFlush(rank)
        case .royalFlush:
            if rank != .ace {
                return nil
            }
            self = .royalFlush
        }
    }
    
    public init?(cards: [PlayingCard]) {
        guard let hand = Deal(cards: cards) else {
            return nil
        }
        self = hand.evaluate().map()
    }
        
    /// The high card of the hand
    public var highestRank: Rank? {
        let mirror = Mirror(reflecting: self)
        let child = mirror.children.first
        return child?.value as? Rank
    }
    
    public static func <(lhs: Hand, rhs: Hand) -> Bool {
        lhs.assessment < rhs.assessment
    }
    
    public var description: String {
        assessment.description
    }
    
    private var assessment: Assessment {
        switch self {
        case .highCard(let rank): return Assessment(score: .highCard, highestRank: rank)
        case .pair(let rank): return Assessment(score: .pair, highestRank: rank)
        case .twoPair(let rank): return Assessment(score: .twoPair, highestRank: rank)
        case .threeKind(let rank): return Assessment(score: .threeKind, highestRank: rank)
        case .straight(let rank): return Assessment(score: .straight, highestRank: rank)
        case .fourKind(let rank): return Assessment(score: .fourKind, highestRank: rank)
        case .flush(let rank): return Assessment(score: .flush, highestRank: rank)
        case .fullHouse(let rank): return Assessment(score: .fullHouse, highestRank: rank)
        case .straightFlush(let rank): return Assessment(score: .straightFlush, highestRank: rank)
        case .royalFlush: return Assessment(score: .royalFlush, highestRank: .ace)
        }
    }
}

private extension Assessment {
    
    func map() -> Hand {
        switch score {
        case .highCard:
            return .highCard(highestRank)
        case .pair:
            return .pair(highestRank)
        case .twoPair:
            return .twoPair(highestRank)
        case .threeKind:
            return .threeKind(highestRank)
        case .straight:
            return .straight(highestRank)
        case .fourKind:
            return .fourKind(highestRank)
        case .flush:
            return .flush(highestRank)
        case .fullHouse:
            return .fullHouse(highestRank)
        case .straightFlush:
            return .straightFlush(highestRank)
        case .royalFlush:
            return .royalFlush
        }
    }
}
