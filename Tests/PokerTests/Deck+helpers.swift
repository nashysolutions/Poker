import Foundation
import PlayingCards

extension Deck {
    
    func deal(cards: Int) -> [PlayingCard] {
        var collection: [PlayingCard] = []
        for _ in 1...cards {
            if self.cards.isEmpty {
                break
            }
            let card = self.cards.removeLast()
            collection.append(card)
        }
        return collection
    }
}
