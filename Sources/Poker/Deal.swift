import PlayingCards

struct Deal {
    
    let cards: [PlayingCard]
    
    init?(cards: [PlayingCard]) {
        guard (2...7).contains(cards.count) else {
            return nil
        }
        self.cards = cards.sorted()
    }
    
    func evaluate() -> Assessment {
        Score.evaluate(cards: cards)
    }
}
