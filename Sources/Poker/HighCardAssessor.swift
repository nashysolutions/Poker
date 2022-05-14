import Foundation
import PlayingCards

struct HighCardAssessor: Assessable {
    
    // Assumes sorted
    let cards: [PlayingCard]
    
    private(set) var confirmed: Bool = false
    private(set) var highCards = Set<PlayingCard>()
    
    init(cards: [PlayingCard]) {
        self.cards = cards
        evaluate()
    }
    
    mutating func evaluate() {
        confirmed = true
        highCards.insert(cards.last!)
    }
}
