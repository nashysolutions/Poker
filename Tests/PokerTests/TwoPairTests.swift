import XCTest
import PlayingCards
@testable import Poker

final class TwoPairTests: XCTestCase {
    
    func testHighCard() {
        var cards = Score.twoPair.example
        cards.sort()
        let hand = TwoPairAssessor(cards: cards)
        XCTAssertEqual(hand.highestCard?.rank, Rank.king)
    }
    
    func testMinimumSequence() {
        let cards = Score.twoPair.example.dropFirst(2)
        var hand = TwoPairAssessor(cards: Array(cards).sorted())
        hand.evaluate()
        XCTAssertTrue(cards.count == 3)
        XCTAssertFalse(hand.confirmed)
    }
}
