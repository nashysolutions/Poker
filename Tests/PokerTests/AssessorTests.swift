import XCTest
import PlayingCards
@testable import Poker

final class AssessorTests: XCTestCase {
    
    private struct Assessor: Assessable {
        let score: Score? = nil
        let cards: [PlayingCard]
        mutating func evaluate() {}
        init(cards: [PlayingCard]) {
            self.cards = cards
        }
        var confirmed: Bool = false
        var highCards: Set<PlayingCard> {
            Set(cards)
        }
    }
    
    func testIsLower() {
        let hand1 = Assessor(cards:[
            PlayingCard(rank: .nine, suit: .clubs),
            PlayingCard(rank: .eight, suit: .clubs)
        ])
        let hand2 = Assessor(cards: [
            PlayingCard(rank: .queen, suit: .hearts),
            PlayingCard(rank: .king, suit: .clubs)
        ])
        XCTAssertTrue(hand1.isLower(than: hand2))
    }
}
