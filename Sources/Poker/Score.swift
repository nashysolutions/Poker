import Foundation
import PlayingCards

enum Score: Int, CaseIterable, Comparable, CustomStringConvertible {
    
    case highCard
    case pair
    case twoPair
    case threeKind
    case straight
    case fourKind
    case flush
    case fullHouse
    case straightFlush
    case royalFlush
    
    static func <(lhs: Score, rhs: Score) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    
    static func evaluate(cards: [PlayingCard]) -> Assessment {
        Score.assessments.reversed().map { Assessment in
            Assessment.init(cards: cards)
        }.first { $0.confirmed }!.assessment
    }
    
    var description: String {
        switch self {
        case .highCard:
            return "High Card"
        case .pair:
            return "Pair"
        case .twoPair:
            return "Two Pair"
        case .threeKind:
            return "Three Kind"
        case .straight:
            return "Straight"
        case .fourKind:
            return "Four Kind"
        case .flush:
            return "Flush"
        case .fullHouse:
            return "Full House"
        case .straightFlush:
            return "Straight Flush"
        case .royalFlush:
            return "Royal Flush"
        }
    }
}

private extension Score {
    
    static var assessments: [Assessable.Type] {
        allCases.map {
            $0.assessment
        }
    }
    
    private var assessment: Assessable.Type {
        switch self {
        case .highCard: return HighCardAssessor.self
        case .pair: return PairAssessor.self
        case .twoPair: return TwoPairAssessor.self
        case .threeKind: return ThreeKindAssessor.self
        case .straight: return StraightAssessor.self
        case .fourKind: return FourKindAssessor.self
        case .flush: return FlushAssessor.self
        case .fullHouse: return FullHouseAssessor.self
        case .straightFlush: return StraightFlushAssessor.self
        case .royalFlush: return RoyalFlushAssessor.self
        }
    }
}
