import Foundation
import PlayingCards

private extension Rank {
    
    func incremented(by number: Int) -> Rank? {
        Rank(scoreValue + number)
    }
}

private extension PlayingCard {
    
    func ranksLower(than card: PlayingCard, by number: Int) -> Bool {
        rank.incremented(by: number) == card.rank
    }
}

struct StraightAssessor: Assessable {
    
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
        if isStraight == false {
            return
        }
        confirmed = true
        highCards.insert(cards.last!)
    }
    
    private var isStraight: Bool {
        var previousCard: PlayingCard?
        for card in cards {
            if previousCard == nil {
                previousCard = card
                continue
            }
            if previousCard!.ranksLower(than: card, by: 1) == false {
                return false
            }
            previousCard = card
        }
        return true
    }
}
