import Foundation
import PlayingCards

extension Array where Element == PlayingCard {
    
    func first<T: Hashable>(count: Int, matching keyPath: KeyPath<PlayingCard, T>) -> (T, [PlayingCard])? {
        for record in self.lookupTable(for: keyPath) {
            let cards = record.1
            if cards.count >= count {
                return (record.0, record.1)
            }
        }
        return nil
    }
        
    private func lookupTable<T: Hashable>(for keyPath: KeyPath<PlayingCard, T>) -> [T : [PlayingCard]] {
        var entries = [T : [PlayingCard]]()
        for card in self {
            
            let entriesKey = card[keyPath: keyPath]
            
            var cards = entries[entriesKey] ?? []
            cards.append(card)
            entries[entriesKey] = cards
        }
        return entries
    }
}
