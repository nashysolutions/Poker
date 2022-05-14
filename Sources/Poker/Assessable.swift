import Foundation
import PlayingCards

protocol Assessable {
    var confirmed: Bool { get }
    var cards: [PlayingCard] { get }
    init(cards: [PlayingCard])
    var highCards: Set<PlayingCard> { get }
    mutating func evaluate()
}

extension Assessable {
    
    func isLower(than assessment: Self) -> Bool {
        let lhs = highCards.sorted()
        let rhs = assessment.highCards.sorted()
        return lhs.lexicographicallyPrecedes(rhs)
    }
}

extension Assessable {
    
    var assessment: Assessment {
        let card = highCards.sorted().last!
        return Assessment(score: score, highestRank: card.rank)
    }
    
    private var score: Score {
        if self is RoyalFlushAssessor {
            return .royalFlush
        } else if self is StraightFlushAssessor {
            return .straightFlush
        } else if self is FullHouseAssessor {
            return .fullHouse
        } else if self is FlushAssessor {
            return .flush
        } else if self is FourKindAssessor {
            return .fourKind
        } else if self is StraightAssessor {
            return .straight
        } else if self is ThreeKindAssessor {
            return .threeKind
        } else if self is TwoPairAssessor {
            return .twoPair
        } else if self is PairAssessor {
            return .pair
        }
        return .highCard
    }
}
