import XCTest
import PlayingCards
@testable import Poker

final class StraightTests: XCTestCase {
    
    func testHighCard() {
        var cards = Score.straight.example
        cards.sort()
        let hand = StraightAssessor(cards: cards)
        XCTAssertEqual(hand.highestCard?.rank, Rank.six)
    }
    
    func testMinimumSequence() {
        let cards = Score.straight.example.dropFirst()
        var hand = StraightAssessor(cards: Array(cards).sorted())
        hand.evaluate()
        XCTAssertTrue(cards.count == 4)
        XCTAssertFalse(hand.confirmed)
    }
}
