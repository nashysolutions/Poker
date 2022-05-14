import Foundation
import PlayingCards

struct PairAssessor: Assessable {
    
    // Assumes sorted
    let cards: [PlayingCard]
    
    private(set) var confirmed: Bool = false
    private(set) var highCards = Set<PlayingCard>()
    
    init(cards: [PlayingCard]) {
        self.cards = cards
        evaluate()
    }
    
    mutating func evaluate() {
        if let (_, cards) = cards.first(count: 2, matching: \.rank) {
            confirmed = true
            highCards.insert(cards.last!)
        }
    }
}

struct ThreeKindAssessor: Assessable {
    
    // Assumes sorted
    let cards: [PlayingCard]
    
    private(set) var confirmed: Bool = false
    private(set) var highCards = Set<PlayingCard>()
    
    init(cards: [PlayingCard]) {
        self.cards = cards
        evaluate()
    }
    
    mutating func evaluate() {
        guard cards.count >= 3 else {
            return
        }
        if let (_, cards) = cards.first(count: 3, matching: \.rank) {
            confirmed = true
            highCards.insert(cards.last!)
        }
    }
}

struct FourKindAssessor: Assessable {
    
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
        if let (_, cards) = cards.first(count: 4, matching: \.rank) {
            confirmed = true
            highCards.insert(cards.last!)
        }
    }
}
