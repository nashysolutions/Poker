import Foundation
import PlayingCards

extension PlayingCard: Comparable {
    
    public static func <(lhs: PlayingCard, rhs: PlayingCard) -> Bool {
        lhs.rank < rhs.rank
    }
}
