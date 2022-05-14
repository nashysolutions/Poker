import Foundation
import PlayingCards

private extension Array {
    
    func split(at index: Index) -> (first: [Element], second: [Element]) {
        if index == 0 {
            return (self, [])
        }
        if index >= count {
            return ([], self)
        }
        let pre = Array(prefix(upTo: index))
        let post = Array(suffix(from: index))
        return (pre, post)
    }
}

private extension Array where Element == Assessable {
    
    var allConfirmed: Bool {
        for assessment in self {
            if assessment.confirmed == false {
                return false
            }
        }
        return true
    }
    
    var highCards: Set<PlayingCard> {
        reduce(Set<PlayingCard>(), { accumulation, assessment in
            accumulation.union(assessment.highCards)
        })
    }
}

struct TwoPairAssessor: Assessable {
    
    // Assumes sorted
    let cards: [PlayingCard]
    
    private(set) var confirmed: Bool = false
    private(set) var highCards = Set<PlayingCard>()
    
    init(cards: [PlayingCard]) {
        self.cards = cards
        evaluate()
    }
    
    mutating func evaluate() {
        guard cards.count >= 4 else {
            return
        }
        for index in 0...cards.count {
            let (lhs, rhs) = cards.split(at: index)
            let assessments: [Assessable] = [PairAssessor(cards: lhs), PairAssessor(cards: rhs)]
            if assessments.allConfirmed == false {
                continue
            }
            confirmed = true
            highCards = assessments.highCards
        }
    }
}

struct StraightFlushAssessor: Assessable {
    
    // Assumes sorted
    let cards: [PlayingCard]
    
    var isRoyalFlush: Bool {
        confirmed && highCards.sorted().last?.rank == .ace
    }
    
    private(set) var confirmed: Bool = false
    private(set) var highCards = Set<PlayingCard>()
    
    init(cards: [PlayingCard]) {
        self.cards = cards
        evaluate()
    }
    
    mutating func evaluate() {
        guard cards.count >= 5 else {
            return
        }
        let assessments: [Assessable] = [
            StraightAssessor(cards: cards),
            FlushAssessor(cards: cards)
        ]
        if assessments.allConfirmed {
            confirmed = true
            highCards = assessments.highCards
        }
    }
}

struct RoyalFlushAssessor: Assessable {
    
    // Assumes sorted
    let cards: [PlayingCard]
    
    private(set) var confirmed: Bool = false
    private(set) var highCards = Set<PlayingCard>()
    
    init(cards: [PlayingCard]) {
        self.cards = cards
        evaluate()
    }
    
    mutating func evaluate() {
        guard cards.count >= 5 else {
            return
        }
        let assessment = StraightFlushAssessor(cards: cards)
        confirmed = assessment.isRoyalFlush
        if confirmed {
            highCards = assessment.highCards
        }
    }
}

struct FullHouseAssessor: Assessable {
    
    // Assumes sorted
    let cards: [PlayingCard]
    
    private(set) var confirmed: Bool = false
    private(set) var highCards = Set<PlayingCard>()
    
    init(cards: [PlayingCard]) {
        self.cards = cards
        evaluate()
    }
    
    mutating func evaluate() {
        guard cards.count >= 5 else {
            return
        }
        for index in 0...cards.count {
            let (lhs, rhs) = cards.split(at: index)
            if match([PairAssessor(cards: lhs), ThreeKindAssessor(cards: rhs)]) { break }
            if match([ThreeKindAssessor(cards: lhs), PairAssessor(cards: rhs)]) { break }
        }
    }
    
    private mutating func match(_ assessments: [Assessable]) -> Bool {
        if assessments.allConfirmed {
            confirmed = true
            highCards = assessments.highCards
            return true
        }
        return false
    }
}
