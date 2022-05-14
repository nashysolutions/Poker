import Foundation
import PlayingCards

struct FlushAssessor: Assessable {
    
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
        if let (_, cards) = cards.first(count: 5, matching: \.suit) {
            confirmed = true
            highCards.insert(cards.last!)
        }
    }
}
