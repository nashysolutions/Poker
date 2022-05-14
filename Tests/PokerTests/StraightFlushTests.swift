import XCTest
import PlayingCards
@testable import Poker

final class StraightFlushTests: XCTestCase {
    
    func testHighCard() {
        var cards = Score.straightFlush.example
        cards.sort()
        let hand = StraightFlushAssessor(cards: cards)
        XCTAssertEqual(hand.highestCard?.rank, Rank.six)
    }
    
    func testMinimumSequence() {
        let cards = Score.straightFlush.example.dropFirst()
        var hand = StraightFlushAssessor(cards: Array(cards).sorted())
        hand.evaluate()
        XCTAssertTrue(cards.count == 4)
        XCTAssertFalse(hand.confirmed)
    }
}
