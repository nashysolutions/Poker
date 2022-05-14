import PlayingCards
@testable import Poker

extension Assessable {
    
    var highestCard: PlayingCard? {
        highCards.sorted().last
    }
}
